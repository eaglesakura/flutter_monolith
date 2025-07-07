import 'dart:io';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:dartx/dartx_io.dart';
import 'package:monolith/src/localization/csv2arb/l10n_localized_text_table.dart';
import 'package:monolith/src/localization/csv2arb/localized_text.dart';
import 'package:monolith/src/localization/dto/monolith_localization_dto.dart';
import 'package:monolith/src/localization/generator/l10n_helper_generator.dart';
import 'package:monolith/src/localization/generator/l10n_helper_generator_template.dart';
import 'package:monolith/src/localization/generator/l10n_strings_mixin_generator.dart';
import 'package:monolith/src/localization/generator/l10n_strings_mixin_generator_template.dart';
import 'package:monolith/src/localization/localization_options.dart';
import 'package:monolith/src/monolith.dart';

final _log = Logger.file();

extension MonolithLocalizationExtensions on Monolith {
  MonolithLocalizationDto _parseConfiguration() {
    final localization = configurations['localization'];
    if (localization == null) {
      return const MonolithLocalizationDto();
    }
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
  Future generateLocalization(LocalizationOptions options) async {
    final dto = _parseConfiguration();
    final languages = dto.languages ?? [];
    final table = L10nLocalizedTextTable();
    final moduleHelperClassName =
        dto.moduleHelperClassName ?? 'L10nStringsMixin';
    final moduleHelperPath = dto.moduleHelperPath ?? 'lib/gen/strings.dart';
    final arbPath = dto.arbPath ?? 'lib/l10n/';
    final arbFilePrefix = dto.arbFilePrefix ?? 'intl_app_';
    final l10nHelperClassName = dto.l10nHelperClassName ?? 'L10nHelper';
    final l10nHelperPath = dto.l10nHelperPath ?? 'lib/l10n/l10n_helper.dart';

    // すべてのRunnerを巡回
    for (final runner in [...options.modules, options.appPackage]) {
      final resDirectory = runner.directory('res');
      if (!resDirectory.existsSync()) {
        continue;
      }

      _log.i('generate localization: ${runner.name}');

      // strings*.csvファイルを対象とする
      final stringsCsvFiles = resDirectory
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (e) => e.name.startsWith('strings') && e.name.endsWith('.csv'),
          );

      for (final file in stringsCsvFiles) {
        _log.i('add csv: ${file.path}');

        String normalizeText(String text) {
          return text.replaceAll(r'\\n', '\n');
        }

        final LocalizedTextFactory factory =
            options.localizedTextFactory ??
            (Map<String, String> row) {
              final id = '${runner.name}_${row['id']!}';
              var description = row['description'];
              final text = <String, String>{};
              for (final language in languages) {
                final value = row[language]!;
                text[language] = normalizeText(value);
                description ??= value;
              }
              return LocalizedText(
                packageName: runner.name,
                id: id,
                text: text,
                description: description,
                placeHolders: LocalizedText.parsePlaceholders(
                  text.values.first,
                ),
              );
            };

        table.addCsv(
          csvFile: file,
          factory: factory,
        );
        // packageごとのアクセスヘルパーを生成
        final stringsMixInGenerator = L10nStringsMixinGenerator();
        final dartFile = runner.file(moduleHelperPath);
        await stringsMixInGenerator.generate(
          dartFile,
          l10nStringsMixinMustache:
              options.stringsMixinTemplate ?? l10nStringsMixinMustache,
          className: moduleHelperClassName,
          localizedTexts: [
            ...table.localizedTexts.where((e) => e.packageName == runner.name),
          ],
        );
        // format
        await runner.exec('dart', arguments: ['format', dartFile.path]);
      }
    }
    _log.i('generate arb files');
    final arbDirectory = options.appPackage.directory(arbPath);
    await table.generateArb(
      arbDirectory,
      arbFileNamePrefix: arbFilePrefix,
    );
    // l10n.dartを生成
    await options.appPackage.pubGet();

    // アクセスヘルパーを生成
    final dartFile = options.appPackage.file(l10nHelperPath);
    await L10nHelperGenerator().generate(
      dartFile,
      className: l10nHelperClassName,
      appDelegateMustache: options.l10nHelperTemplate ?? l10nHelperMustache,
      importL10nDartPath: 'l10n.dart',
      localizedTexts: table.localizedTexts,
    );
    // format
    await options.appPackage.exec('dart', arguments: ['format', dartFile.path]);
  }
}
