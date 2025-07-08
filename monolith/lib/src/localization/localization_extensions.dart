import 'dart:io';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/src/localization/csv2arb/l10n_localized_text_table.dart';
import 'package:monolith/src/localization/csv2arb/localized_text.dart';
import 'package:monolith/src/localization/dto/monolith_localization_dto.dart';
import 'package:monolith/src/localization/generator/l10n_helper_generator.dart';
import 'package:monolith/src/localization/generator/l10n_helper_generator_template.dart';
import 'package:monolith/src/localization/generator/l10n_strings_mixin_generator.dart';
import 'package:monolith/src/localization/generator/l10n_strings_mixin_generator_template.dart';
import 'package:monolith/src/monolith.dart';
import 'package:monolith/src/package/dart_package_runner.dart';
import 'package:path/path.dart' as p;

final _log = Logger.file();

extension MonolithLocalizationExtensions on Monolith {
  MonolithLocalizationDto _parseConfiguration() {
    final localization = configurations['localization'];
    return MonolithLocalizationDto.fromJson(
      localization as Map<String, dynamic>,
    );
  }

  /// ローカライゼーションファイルを生成する.
  ///
  /// step1. L10nの初期設定を行う
  /// https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  /// e.g.)
  /// path/to/app/pubspec.yaml
  /// ```yaml
  /// flutter:
  ///   generate: true
  /// flutter_intl:
  ///   enabled: true
  /// dependencies:
  ///   flutter_localizations:
  ///     sdk: flutter
  /// ```
  ///
  /// path/to/app/l10n.yaml
  /// ```yaml
  /// arb-dir: lib/l10n
  /// template-arb-file: intl_app_ja.arb
  /// output-localization-file: l10n.dart
  /// output-class: L10n
  /// synthetic-package: false
  /// ```
  ///
  /// step2. 言語ファイルを各モジュールに作成する
  /// e.g.)
  /// path/to/module/res/strings.csv
  /// ```csv
  /// id,ja,en,description
  /// yes,はい,YES,text of 'yes'
  /// ```
  ///
  /// step3. ヘルパクラスを生成する
  /// Monolith.generateLocalization() を実行し、下記を作成する
  /// * app/
  ///     * lib/l10n/
  ///         * intl_app_*.arb
  ///         * l10n.dart
  ///         * l10n_helper.dart
  /// * packages/
  ///     * module/
  ///         * lib/gen/strings.dart
  Future generateLocalization() async {
    final dto = _parseConfiguration();
    final appPackage = require(dto.app.packageName);
    final languages = dto.languages;
    final table = L10nLocalizedTextTable();
    final moduleHelperClassName = dto.package.moduleHelperClassName;
    final moduleHelperPath = dto.package.moduleHelperPath;
    final arbPath = dto.app.arbPath;
    final arbFilePrefix = dto.app.arbFilePrefix;
    final l10nHelperClassName = dto.app.l10nHelperClassName;
    final l10nHelperPath = dto.app.l10nHelperPath;

    _log.i('arb generate to: ${appPackage.name}');
    final packages = () {
      final pathPrefixes = dto.package.pathPrefixes
          .map((e) => relativeDirectory(e))
          .toSet();
      return [
        ...workspace
            .where(
              (e) => pathPrefixes.any((e) => e.path.startsWith(e.path)),
            )
            .map((e) {
              _log.i('  - sub package: ${e.name}');
              return e;
            }),
        appPackage,
      ];
    }();

    // すべてのRunnerを巡回
    for (final pkg in packages) {
      final resDirectory = pkg.relativeDirectory(dto.package.resourcesPath);
      if (!resDirectory.existsSync()) {
        continue;
      }

      _log.i('generate localization: ${pkg.name}');

      // strings*.csvファイルを対象とする
      final stringsCsvFiles = resDirectory
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (e) {
              final name = p.basename(e.path);
              return name.startsWith('strings') && name.endsWith('.csv');
            },
          );

      for (final file in stringsCsvFiles) {
        _log.i('add csv: ${file.path}');

        String normalizeText(String text) {
          return text.replaceAll(r'\\n', '\n');
        }

        LocalizedText localizationTextFactory(Map<String, String> row) {
          final id = '${pkg.name}_${row['id']!}';
          var description = row['description'];
          final text = <String, String>{};
          for (final language in languages) {
            final value = row[language]!;
            text[language] = normalizeText(value);
            description ??= value;
          }
          return LocalizedText(
            packageName: pkg.name,
            id: id,
            text: text,
            description: description,
            placeHolders: LocalizedText.parsePlaceholders(
              text.values.first,
            ),
          );
        }

        table.addCsv(
          csvFile: file,
          factory: localizationTextFactory,
        );
        // packageごとのアクセスヘルパーを生成
        final stringsMixInGenerator = L10nStringsMixinGenerator();
        final dartFile = pkg.relativeFile(moduleHelperPath);
        await stringsMixInGenerator.generate(
          dartFile,
          l10nStringsMixinMustache: l10nStringsMixinMustache,
          className: moduleHelperClassName,
          localizedTexts: [
            ...table.localizedTexts.where((e) => e.packageName == pkg.name),
          ],
        );
        // format
        await pkg.exec('dart', arguments: ['format', dartFile.path]);
      }
    }
    _log.i('generate arb files');
    final arbDirectory = appPackage.relativeDirectory(arbPath);
    await table.generateArb(
      arbDirectory,
      arbFileNamePrefix: arbFilePrefix,
    );
    // l10n.dartを生成
    await appPackage.pubGet();

    // アクセスヘルパーを生成
    final dartFile = appPackage.relativeFile(l10nHelperPath);
    await L10nHelperGenerator().generate(
      dartFile,
      className: l10nHelperClassName,
      appDelegateMustache: l10nHelperMustache,
      importL10nDartPath: 'l10n.dart',
      localizedTexts: table.localizedTexts,
    );
    // format
    await appPackage.exec('dart', arguments: ['format', dartFile.path]);
  }
}
