import 'dart:io';

import 'package:monolith_localization/src/csv2arb/localized_text.dart';
import 'package:monolith_localization/src/generator/l10n_helper_generator.dart';
import 'package:monolith_localization/src/generator/l10n_helper_generator_template.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  group('L10nHelperGenerator', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('l10n_helper_generator_');
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('material_ui 向けの L10nHelper を生成する', () async {
      final output = File(p.join(tempDir.path, 'l10n_helper.dart'));

      await L10nHelperGenerator().generate(
        output,
        appDelegateMustache: l10nHelperMustache,
        className: 'L10nHelper',
        importL10nDartPath: 'l10n.dart',
        localizedTexts: [
          LocalizedText(
            packageName: 'example',
            id: 'hello',
            text: const {'ja': 'こんにちは', 'en': 'Hello'},
            placeHolders: const [],
            description: 'greeting',
          ),
          LocalizedText(
            packageName: 'example',
            id: 'greet',
            text: const {'ja': 'こんにちは {name}', 'en': 'Hello {name}'},
            placeHolders: const ['name'],
            description: 'greet with name',
          ),
        ],
      );

      final generated = output.readAsStringSync();

      expect(
        generated,
        contains("import 'package:material_ui/material_ui.dart';"),
      );
      expect(generated, isNot(contains('package:flutter/material.dart')));
      expect(
        generated,
        isNot(
          contains(
            'package:flutter_localizations/flutter_localizations.dart',
          ),
        ),
      );
      expect(
        generated,
        contains('...GlobalMaterialLocalizations.delegates'),
      );
      expect(generated, contains('return l10n.hello;'));
      expect(generated, contains('return l10n.greet(name,);'));
      expect(generated, contains('L10nHelper.configure(result);'));
    });

    test('生成した L10nHelper が material_ui 依存で解析できる', () async {
      final packageRoot = _packageRoot();
      final runtimePath = p.normalize(
        p.join(packageRoot.path, '..', 'monolith_localization_runtime'),
      );
      expect(
        Directory(runtimePath).existsSync(),
        isTrue,
        reason: 'monolith_localization_runtime が見つかりません: $runtimePath',
      );

      final libDir = Directory(p.join(tempDir.path, 'lib'))..createSync();
      File(p.join(libDir.path, 'l10n.dart')).writeAsStringSync(_stubL10nSource);

      await L10nHelperGenerator().generate(
        File(p.join(libDir.path, 'l10n_helper.dart')),
        appDelegateMustache: l10nHelperMustache,
        className: 'L10nHelper',
        importL10nDartPath: 'l10n.dart',
        localizedTexts: [
          LocalizedText(
            packageName: 'example',
            id: 'hello',
            text: const {'ja': 'こんにちは', 'en': 'Hello'},
            placeHolders: const [],
            description: 'greeting',
          ),
          LocalizedText(
            packageName: 'example',
            id: 'greet',
            text: const {'ja': 'こんにちは {name}', 'en': 'Hello {name}'},
            placeHolders: const ['name'],
            description: 'greet with name',
          ),
        ],
      );

      File(p.join(tempDir.path, 'pubspec.yaml')).writeAsStringSync('''
name: l10n_helper_build_check
publish_to: none

environment:
  sdk: ">=3.8.0 <4.0.0"
  flutter: ">=3.50.0"

dependencies:
  flutter:
    sdk: flutter
  material_ui: any
  monolith_localization_runtime:
    path: ${runtimePath.replaceAll(r'\', '/')}
''');

      File(p.join(tempDir.path, 'analysis_options.yaml')).writeAsStringSync('''
analyzer:
  errors:
    implementation_imports: ignore
    invalid_use_of_internal_member: ignore
''');

      final pubGet = await Process.run(
        'flutter',
        ['pub', 'get'],
        workingDirectory: tempDir.path,
        runInShell: true,
      );
      expect(
        pubGet.exitCode,
        0,
        reason: 'flutter pub get failed:\n${pubGet.stdout}\n${pubGet.stderr}',
      );

      final analyze = await Process.run(
        'dart',
        ['analyze', '--fatal-infos', 'lib'],
        workingDirectory: tempDir.path,
        runInShell: true,
      );
      expect(
        analyze.exitCode,
        0,
        reason: 'dart analyze failed:\n${analyze.stdout}\n${analyze.stderr}',
      );
    }, timeout: const Timeout(Duration(minutes: 3)));
  });
}

Directory _packageRoot() {
  var dir = Directory.current;
  while (true) {
    final pubspec = File(p.join(dir.path, 'pubspec.yaml'));
    if (pubspec.existsSync()) {
      final content = pubspec.readAsStringSync();
      if (content.contains('name: monolith_localization\n') ||
          content.contains('name: monolith_localization\r\n')) {
        return dir;
      }
    }
    final parent = dir.parent;
    if (parent.path == dir.path) {
      fail('monolith_localization の package root を特定できません');
    }
    dir = parent;
  }
}

const _stubL10nSource = r'''
import 'package:material_ui/material_ui.dart';

class L10n {
  const L10n._();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  String get hello => 'Hello';

  String greet(String name) => 'Hello $name';
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  bool isSupported(Locale locale) {
    return L10n.supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    );
  }

  @override
  Future<L10n> load(Locale locale) async => const L10n._();

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) => false;
}
''';
