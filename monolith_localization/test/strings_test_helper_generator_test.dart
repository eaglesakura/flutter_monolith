import 'dart:convert';
import 'dart:io';

import 'package:monolith_localization/src/dto/monolith_localization_dto.dart';
import 'package:monolith_localization/src/dto/monolith_localization_test_helper_dto.dart';
import 'package:monolith_localization/src/generator/strings_test_helper_generator.dart';
import 'package:monolith_localization/src/generator/strings_test_helper_generator_template.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() {
    // 問題調査のため systemTemp ではなくパッケージ配下の build/ を使う.
    // 既存の l10n_localized_text_table_test.dart（build/l10n）と同様.
    tempDir = Directory('build/strings_test_helper');
    // 前回実行の残骸を掃除してから作り直す
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
    tempDir.createSync(recursive: true);
  });

  // NOTE.
  // tearDown では削除しない。失敗時に build/strings_test_helper/ を直接確認できるようにする.
  // 次回 setUp で掃除される.

  group('normalizeLangIdentifier', () {
    // テスト対象:
    // normalizeLangIdentifier
    //
    // テスト内容:
    // 単純な言語コード `ja` はそのまま返る.
    test('ja はそのまま', () {
      expect(
        normalizeLangIdentifier('ja'),
        'ja',
        reason: '単純な言語コードは正規化後も同一であること',
      );
    });

    // テスト対象:
    // normalizeLangIdentifier
    //
    // テスト内容:
    // ハイフン付き言語コード `zh-Hans` は `zh_Hans` に正規化される.
    test('zh-Hans は zh_Hans になる', () {
      expect(
        normalizeLangIdentifier('zh-Hans'),
        'zh_Hans',
        reason: 'ハイフンがアンダースコアに置換されること',
      );
    });

    // テスト対象:
    // normalizeLangIdentifier
    //
    // テスト内容:
    // 数字始まりなど識別子化できないコードは FormatException になる.
    test('不正なコードは FormatException', () {
      expect(
        () => normalizeLangIdentifier('123'),
        throwsA(isA<FormatException>()),
        reason: '識別子化できない言語コードは FormatException であること',
      );
    });
  });

  group('MonolithLocalizationTestHelperDto', () {
    // テスト対象:
    // MonolithLocalizationTestHelperDto.fromJson
    //
    // テスト内容:
    // 全フィールド指定時に正しくデシリアライズされる.
    test('fromJson 正常系', () {
      final dto = MonolithLocalizationTestHelperDto.fromJson({
        'package_name': 'foundation_resources',
        'test_helper_class_name': 'StringsTestHelper',
        'test_helper_path': 'lib/gen/strings_test_helper.dart',
      });
      expect(
        dto.packageName,
        'foundation_resources',
        reason: 'package_name がデシリアライズされること',
      );
      expect(
        dto.testHelperClassName,
        'StringsTestHelper',
        reason: 'test_helper_class_name がデシリアライズされること',
      );
      expect(
        dto.testHelperPath,
        'lib/gen/strings_test_helper.dart',
        reason: 'test_helper_path がデシリアライズされること',
      );
    });

    // テスト対象:
    // MonolithLocalizationDto.fromJson
    //
    // テスト内容:
    // test_helper 省略時は後方互換として testHelper が null になる.
    test('親 DTO で test_helper 省略時は null', () {
      final dto = MonolithLocalizationDto.fromJson({
        'languages': ['ja'],
        'app': {'package_name': 'app'},
        'package': {
          'path_prefixes': ['app_packages/'],
        },
      });
      expect(
        dto.testHelper,
        isNull,
        reason: 'test_helper 省略時は null（後方互換）であること',
      );
    });

    // テスト対象:
    // MonolithLocalizationTestHelperDto.fromJson
    //
    // テスト内容:
    // class_name / path 省略時は Default 値が適用される.
    test('class_name / path 省略時はデフォルト', () {
      final dto = MonolithLocalizationTestHelperDto.fromJson({
        'package_name': 'foundation_resources',
      });
      expect(
        dto.testHelperClassName,
        'StringsTestHelper',
        reason: 'class_name 省略時のデフォルトが StringsTestHelper であること',
      );
      expect(
        dto.testHelperPath,
        'lib/gen/strings_test_helper.dart',
        reason: 'path 省略時のデフォルトが lib/gen/strings_test_helper.dart であること',
      );
    });

    // テスト対象:
    // MonolithLocalizationTestHelperDto.fromJson
    //
    // テスト内容:
    // 必須の package_name 欠落時はデシリアライズ例外になる.
    test('package_name 欠落は例外', () {
      expect(
        () => MonolithLocalizationTestHelperDto.fromJson({
          'test_helper_class_name': 'StringsTestHelper',
        }),
        throwsA(anything),
        reason: 'package_name 必須欠落時は例外であること',
      );
    });
  });

  group('StringsTestHelperGenerator', () {
    // テスト対象:
    // StringsTestHelperGenerator.generate
    //
    // テスト内容:
    // 生成ソース内 Base64 を decode すると元 ARB と一致し、
    // ヘッダー・リリースガード・Mustache 非エスケープが満たされる.
    test('埋め込み Base64 を decode すると元 ARB と一致する', () async {
      final arbDir = Directory(p.join(tempDir.path, 'l10n'))..createSync();
      // description に URL を含め、Base64 に '/' が必ず出るようにする
      // （Mustache HTML エスケープ回帰を検出するため）
      const arbJson =
          '{"@@locale":"ja","example_ok":"OK","@example_ok":{"description":"https://example.com/ok"}}';
      File(p.join(arbDir.path, 'intl_app_ja.arb')).writeAsStringSync(arbJson);

      final out = File(p.join(tempDir.path, 'gen', 'helper.dart'));
      await StringsTestHelperGenerator().generate(
        out,
        mustacheTemplate: stringsTestHelperMustache,
        className: 'StringsTestHelper',
        arbDirectory: arbDir,
        arbFilePrefix: 'intl_app_',
        languages: ['ja'],
      );

      final source = out.readAsStringSync();
      // ヘッダー
      expect(
        source.contains('GENERATED CODE - DO NOT MODIFY BY HAND'),
        isTrue,
        reason: 'GENERATED CODE ヘッダーが含まれること',
      );
      expect(
        source.contains('ignore_for_file:'),
        isTrue,
        reason: 'ignore_for_file が付与されること',
      );
      // 生 JSON がソースに直接出ていないこと
      expect(
        source.contains('"example_ok"'),
        isFalse,
        reason: 'ARB 生 JSON がソースに直接埋め込まれないこと',
      );
      // HTML エスケープ残骸が無いこと
      expect(
        source.contains('&#x2F;'),
        isFalse,
        reason: 'Mustache HTML エスケープ残骸が無いこと',
      );
      // 埋め込み Base64 を取り出して decode し、元 ARB と一致すること
      final match = RegExp(
        r"base64Decode\(\s*'([A-Za-z0-9+/=]+)'",
      ).firstMatch(source);
      expect(match, isNotNull, reason: 'Base64 リテラルを抽出できること');
      final decoded = utf8.decode(base64Decode(match!.group(1)!));
      expect(decoded, arbJson, reason: 'Base64 decode 結果が元 ARB と一致すること');
      // getter 名
      expect(
        source.contains('static String get ja'),
        isTrue,
        reason: '言語 getter ja が生成されること',
      );
      // リリースモードガードが埋め込まれていること
      expect(
        source.contains("bool.fromEnvironment('dart.vm.product')"),
        isTrue,
        reason: 'リリースモードガードが埋め込まれること',
      );
      expect(
        source.contains('UnsupportedError'),
        isTrue,
        reason: 'リリース時例外として UnsupportedError が使われること',
      );
    });

    // テスト対象:
    // StringsTestHelperGenerator.generate
    //
    // テスト内容:
    // 不正な className は生成前に FormatException になる.
    test('不正な className は FormatException', () async {
      final arbDir = Directory(p.join(tempDir.path, 'l10n'))..createSync();
      File(p.join(arbDir.path, 'intl_app_ja.arb')).writeAsStringSync('{}');
      final out = File(p.join(tempDir.path, 'helper.dart'));
      await expectLater(
        StringsTestHelperGenerator().generate(
          out,
          mustacheTemplate: stringsTestHelperMustache,
          className: 'invalid-name',
          arbDirectory: arbDir,
          arbFilePrefix: 'intl_app_',
          languages: ['ja'],
        ),
        throwsA(isA<FormatException>()),
        reason: '不正な className は FormatException であること',
      );
    });

    // テスト対象:
    // StringsTestHelperGenerator.generate
    //
    // テスト内容:
    // 複数言語と識別子正規化（zh-Hans → zh_Hans）が反映される.
    test('複数言語と識別子正規化', () async {
      final arbDir = Directory(p.join(tempDir.path, 'l10n'))..createSync();
      File(p.join(arbDir.path, 'intl_app_ja.arb')).writeAsStringSync('{"a":1}');
      File(
        p.join(arbDir.path, 'intl_app_zh-Hans.arb'),
      ).writeAsStringSync('{"b":2}');

      final out = File(p.join(tempDir.path, 'helper.dart'));
      await StringsTestHelperGenerator().generate(
        out,
        mustacheTemplate: stringsTestHelperMustache,
        className: 'H',
        arbDirectory: arbDir,
        arbFilePrefix: 'intl_app_',
        languages: ['ja', 'zh-Hans'],
      );

      final source = out.readAsStringSync();
      expect(
        source.contains('static String get ja'),
        isTrue,
        reason: 'ja getter が生成されること',
      );
      expect(
        source.contains('static String get zh_Hans'),
        isTrue,
        reason: 'zh-Hans が zh_Hans getter に正規化されること',
      );
    });

    // テスト対象:
    // StringsTestHelperGenerator.generate
    //
    // テスト内容:
    // 正規化後に getter 名が衝突する場合は FormatException になる.
    test('正規化後 getter 名衝突は FormatException', () async {
      final arbDir = Directory(p.join(tempDir.path, 'l10n'))..createSync();
      File(
        p.join(arbDir.path, 'intl_app_zh-Hans.arb'),
      ).writeAsStringSync('{"a":1}');
      File(
        p.join(arbDir.path, 'intl_app_zh_Hans.arb'),
      ).writeAsStringSync('{"b":2}');

      final out = File(p.join(tempDir.path, 'helper.dart'));
      await expectLater(
        StringsTestHelperGenerator().generate(
          out,
          mustacheTemplate: stringsTestHelperMustache,
          className: 'H',
          arbDirectory: arbDir,
          arbFilePrefix: 'intl_app_',
          languages: ['zh-Hans', 'zh_Hans'],
        ),
        throwsA(isA<FormatException>()),
        reason: '正規化後の getter 名衝突は FormatException であること',
      );
    });

    // テスト対象:
    // StringsTestHelperGenerator.generate
    //
    // テスト内容:
    // 指定言語の ARB が無い場合は StateError になる.
    test('ARB 欠落は StateError', () async {
      final arbDir = Directory(p.join(tempDir.path, 'l10n'))..createSync();
      final out = File(p.join(tempDir.path, 'helper.dart'));
      await expectLater(
        StringsTestHelperGenerator().generate(
          out,
          mustacheTemplate: stringsTestHelperMustache,
          className: 'H',
          arbDirectory: arbDir,
          arbFilePrefix: 'intl_app_',
          languages: ['ja'],
        ),
        throwsA(isA<StateError>()),
        reason: 'ARB 欠落時は StateError であること',
      );
    });
  });
}
