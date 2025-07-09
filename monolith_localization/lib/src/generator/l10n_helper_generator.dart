import 'dart:io';

import 'package:meta/meta.dart';
import 'package:monolith_localization/src/csv2arb/localized_text.dart';
import 'package:mustache_template/mustache_template.dart';

/// L10nアクセス用ヘルパークラスを生成する.
@internal
class L10nHelperGenerator {
  L10nHelperGenerator();

  /// 生成する.
  Future generate(
    File outputDartFile, {

    /// template mustache file.
    required String appDelegateMustache,

    /// 出力するクラス名
    String className = 'L10nHelper',

    /// importするl10n.dartのパス
    required String importL10nDartPath,

    /// ローカライズテキスト一覧.
    required List<LocalizedText> localizedTexts,
  }) async {
    final mustacheValues = {
      'importL10n': importL10nDartPath,
      'className': className,
      'localizeStrings': localizedTexts
          .map(
            (e) => <String, dynamic>{
              'id': e.id,
              'placeholders': e.placeHolders,
              'hasPlaceholders': e.placeHolders.isNotEmpty,
            },
          )
          .toList(),
    };

    final template = Template(appDelegateMustache);
    final renderString = template.renderString(mustacheValues);

    final outputDirectory = outputDartFile.parent;
    if (!outputDirectory.existsSync()) {
      outputDirectory.createSync(recursive: true);
    }
    outputDartFile.writeAsStringSync(renderString);
  }
}
