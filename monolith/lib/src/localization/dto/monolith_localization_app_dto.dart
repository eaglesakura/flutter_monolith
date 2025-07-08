// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_localization_app_dto.freezed.dart';
part 'monolith_localization_app_dto.g.dart';

@internal
@freezed
abstract class MonolithLocalizationAppDto with _$MonolithLocalizationAppDto {
  const factory MonolithLocalizationAppDto({
    /// パッケージ名
    @JsonKey(name: 'package_name') required String packageName,

    /// ARBファイルの出力先パス
    @JsonKey(name: 'arb_path') @Default('lib/l10n/') String arbPath,

    /// ARBファイルのファイル名の接頭辞
    @JsonKey(name: 'arb_file_prefix')
    @Default('intl_app_')
    String arbFilePrefix,

    /// L10nHelperのクラス名
    @JsonKey(name: 'l10n_helper_class_name')
    @Default('L10nHelper')
    String l10nHelperClassName,

    /// L10nHelperのパス
    @JsonKey(name: 'l10n_helper_path')
    @Default('lib/l10n/l10n_helper.dart')
    String l10nHelperPath,
  }) = _MonolithLocalizationAppDto;

  factory MonolithLocalizationAppDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithLocalizationAppDtoFromJson(json);
}
