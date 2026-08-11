import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;

// NOTE.
// mustache import は l10n_helper_generator.dart に合わせ mustache_template.dart を使う。
// mustache.dart でも同等（re-export）だが、新規コードではこちらに固定する。
// 既存 Generator 間の import 揺れの統一は本タスク範囲外。

/// 言語コードを Dart 単純識別子へ正規化する.
///
/// 非 `[a-zA-Z0-9_]` を `_` に置換する.
/// 正規化後が `^[a-zA-Z_][a-zA-Z0-9_]*$` に一致しない場合は [FormatException] を投げる.
///
/// Example:
/// ```dart
/// normalizeLangIdentifier('zh-Hans'); // 'zh_Hans'
/// normalizeLangIdentifier('ja'); // 'ja'
/// ```
@visibleForTesting
String normalizeLangIdentifier(String lang) {
  // ハイフン等をアンダースコアへ置換する
  final normalized = lang.replaceAll(RegExp('[^a-zA-Z0-9_]'), '_');
  // Dart 単純識別子として妥当か検証する
  if (!RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$').hasMatch(normalized)) {
    throw FormatException(
      'Language code cannot be normalized to a Dart identifier: $lang',
    );
  }
  return normalized;
}

/// ARB 埋め込みの StringsTestHelper Dart ソースを生成する.
///
/// Unit Test / Widget Preview 向けに、ファイル I/O なしで
/// `LocalizeStringDelegate.injectDelegateForTest` へ渡せる JSON 文字列 getter を出力する.
///
/// Example:
/// ```dart
/// await StringsTestHelperGenerator().generate(
///   outputFile,
///   mustacheTemplate: stringsTestHelperMustache,
///   className: 'StringsTestHelper',
///   arbDirectory: arbDir,
///   arbFilePrefix: 'intl_app_',
///   languages: ['ja', 'zh-Hans'],
/// );
/// ```
@internal
class StringsTestHelperGenerator {
  /// 生成処理用のインスタンスを作成する.
  StringsTestHelperGenerator();

  /// [arbDirectory] 配下の `{arbFilePrefix}{lang}.arb` を読み込み、
  /// Base64 埋め込みのヘルパー Dart を [outputDartFile] に書き出す.
  ///
  /// [languages] の各要素について getter を生成する.
  /// 言語コードは [normalizeLangIdentifier] で識別子化する.
  /// 正規化後の getter 名が衝突した場合は [FormatException] を投げる.
  /// ARB ファイルが存在しない言語がある場合は [StateError] を投げる.
  /// [className] が Dart クラス識別子として不正な場合は [FormatException] を投げる.
  ///
  /// [mustacheTemplate] には通常 `stringsTestHelperMustache` を渡す.
  Future<void> generate(
    File outputDartFile, {
    required String mustacheTemplate,
    required String className,
    required Directory arbDirectory,
    required String arbFilePrefix,
    required List<String> languages,
  }) async {
    // クラス名の妥当性を生成前に検証する
    if (!RegExp(r'^[A-Z][a-zA-Z0-9_]*$').hasMatch(className)) {
      throw FormatException(
        'test_helper_class_name is not a valid Dart class identifier: '
        '$className',
      );
    }

    // Mustache に渡す言語エントリを組み立てる
    final languageEntries = <Map<String, String>>[];
    final usedGetterNames = <String>{};
    for (final sourceLang in languages) {
      // getter 名用に識別子へ正規化する
      final lang = normalizeLangIdentifier(sourceLang);
      // 正規化後の getter 名衝突を生成前に検出する
      if (!usedGetterNames.add(lang)) {
        throw FormatException(
          'Duplicate getter name after language normalization: $lang '
          '(from $sourceLang)',
        );
      }
      // 生成済み ARB のパスを組み立てる
      final arbFile = File(
        p.join(arbDirectory.path, '$arbFilePrefix$sourceLang.arb'),
      );
      // ARB が無い場合はパイプライン不整合として失敗する
      if (!arbFile.existsSync()) {
        throw StateError('ARB file not found: ${arbFile.path}');
      }
      // UTF-8 本文を Base64 する
      final arbContent = arbFile.readAsStringSync();
      final arbBase64 = base64Encode(utf8.encode(arbContent));
      languageEntries.add({
        'sourceLang': sourceLang,
        'lang': lang,
        'arbBase64': arbBase64,
      });
    }

    final mustacheValues = {
      'className': className,
      'languages': languageEntries,
    };

    // テンプレートをレンダリングする
    final template = Template(mustacheTemplate);
    final renderString = template.renderString(mustacheValues);

    // 出力ディレクトリが無ければ作成する
    final outputDirectory = outputDartFile.parent;
    if (!outputDirectory.existsSync()) {
      outputDirectory.createSync(recursive: true);
    }
    outputDartFile.writeAsStringSync(renderString);
  }
}
