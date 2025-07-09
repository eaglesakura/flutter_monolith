// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith_localization/src/dto/monolith_localization_app_dto.dart';
import 'package:monolith_localization/src/dto/monolith_localization_package_dto.dart';

part 'monolith_localization_dto.freezed.dart';
part 'monolith_localization_dto.g.dart';

@internal
@freezed
abstract class MonolithLocalizationDto with _$MonolithLocalizationDto {
  const factory MonolithLocalizationDto({
    /// 対応する言語
    @JsonKey(name: 'languages') required List<String> languages,

    /// アプリパッケージ
    @JsonKey(name: 'app') required MonolithLocalizationAppDto app,

    /// モジュールパッケージ
    @JsonKey(name: 'package') required MonolithLocalizationPackageDto package,
  }) = _MonolithLocalizationDto;

  factory MonolithLocalizationDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithLocalizationDtoFromJson(json);
}
