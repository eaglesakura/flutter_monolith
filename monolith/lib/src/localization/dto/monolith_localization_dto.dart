// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_localization_dto.freezed.dart';
part 'monolith_localization_dto.g.dart';

@internal
@freezed
abstract class MonolithLocalizationDto with _$MonolithLocalizationDto {
  const factory MonolithLocalizationDto({
    @JsonKey(name: 'languages') List<String>? languages,

    /// モジュールヘルパーのクラス名.
    /// デフォルトは `L10nStringsMixin` となる.
    @JsonKey(name: 'module_helper_class_name') String? moduleHelperClassName,

    /// ローカライゼーションヘルパーのパス.
    /// デフォルトは `lib/gen/strings.dart` となる.
    @JsonKey(name: 'module_helper_path') String? moduleHelperPath,

    /// ARBファイルの出力先パス.
    /// デフォルトは `lib/l10n/` となる.
    @JsonKey(name: 'arb_path') String? arbPath,

    /// L10nHelperのクラス名.
    /// デフォルトは `L10nHelper` となる.
    @JsonKey(name: 'l10n_helper_class_name') String? l10nHelperClassName,

    /// ARBファイルのファイル名の接頭辞.
    /// デフォルトは `intl_app_` となる.
    @JsonKey(name: 'arb_file_prefix') String? arbFilePrefix,

    /// L10nHelperのパス.
    /// デフォルトは `lib/l10n/l10n_helper.dart` となる.
    @JsonKey(name: 'l10n_helper_path') String? l10nHelperPath,
  }) = _MonolithLocalizationDto;

  factory MonolithLocalizationDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithLocalizationDtoFromJson(json);
}
