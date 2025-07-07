import 'dart:io';

import 'package:monolith/src/localization/csv2arb/localized_text.dart';
import 'package:mustache_template/mustache.dart';

/// L10nStringsMixinを生成する.
/// 各packageごとに生成することで、packageごとのローカライズテキストを管理する.
class L10nStringsMixinGenerator {
  /// L10nStringsMixinを生成する.
  /// 各packageごとに生成することで、packageごとのローカライズテキストを管理する.
  Future generate(
    File outputDartFile, {

    /// path/to/l10n_strings_mixin.mustache
    required String l10nStringsMixinMustache,

    /// 出力するクラス名
    String className = 'L10nStringsMixin',

    /// ローカライズテキスト一覧.
    required List<LocalizedText> localizedTexts,
  }) async {
    final mustacheValues = {
      'className': className,
      'localizeStrings': localizedTexts
          .map(
            (e) => <String, dynamic>{
              'id': e.id,
              'placeholders': e.placeHolders,
              'hasPlaceholders': e.placeHolders.isNotEmpty,
              'description': e.description ?? e.text.values.first,
            },
          )
          .toList(),
    };

    final template = Template(l10nStringsMixinMustache);
    final renderString = template.renderString(mustacheValues);

    final outputDirectory = outputDartFile.parent;
    if (!outputDirectory.existsSync()) {
      outputDirectory.createSync(recursive: true);
    }
    outputDartFile.writeAsStringSync(renderString);
  }
}
