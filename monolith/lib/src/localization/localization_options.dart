import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith/src/localization/csv2arb/l10n_localized_text_table.dart';
import 'package:monolith/src/package/dart_package_runner.dart';

part 'localization_options.freezed.dart';

@freezed
abstract class LocalizationOptions with _$LocalizationOptions {
  const factory LocalizationOptions({
    /// ビルド対象のアプリパッケージ
    required DartPackageRunner appPackage,

    /// 分散されたモジュールパッケージ.
    ///
    /// [appPackage] + [modules] に含まれるstrings.csvをマージし、
    /// ローカライゼーションファイルを生成する.
    required List<DartPackageRunner> modules,

    /// ローカライゼーションテキストを生成するファクトリ.
    /// nullの場合はデフォルトのファクトリを使用する.
    LocalizedTextFactory? localizedTextFactory,
  }) = _LocalizationOptions;
}
