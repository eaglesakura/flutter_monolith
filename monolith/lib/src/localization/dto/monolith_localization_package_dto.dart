// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_localization_package_dto.freezed.dart';
part 'monolith_localization_package_dto.g.dart';

/// モジュールパッケージの設定
@internal
@freezed
abstract class MonolithLocalizationPackageDto
    with _$MonolithLocalizationPackageDto {
  const factory MonolithLocalizationPackageDto({
    /// パッケージ名
    @JsonKey(name: 'path_prefixes') required List<String> pathPrefixes,

    /// リソースパス
    @JsonKey(name: 'resources_path') @Default('res/') String resourcesPath,

    /// モジュールヘルパーのクラス名
    @JsonKey(name: 'module_helper_class_name')
    @Default('L10nStringsMixin')
    String moduleHelperClassName,

    /// モジュールヘルパーのパス
    @JsonKey(name: 'module_helper_path')
    @Default('lib/gen/strings.dart')
    String moduleHelperPath,
  }) = _MonolithLocalizationPackageDto;

  factory MonolithLocalizationPackageDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithLocalizationPackageDtoFromJson(json);
}
