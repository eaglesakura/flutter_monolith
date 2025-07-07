// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_install_dto.freezed.dart';
part 'monolith_install_dto.g.dart';

@freezed
abstract class MonolithInstallDto with _$MonolithInstallDto {
  const factory MonolithInstallDto({
    @JsonKey(name: 'path') String? path,
    @JsonKey(name: 'base64_file') String? base64File,
    @JsonKey(name: 'text_file') String? textFile,
    @JsonKey(name: 'properties') Map<String, String>? properties,
  }) = _MonolithInstallDto;

  factory MonolithInstallDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithInstallDtoFromJson(json);
}
