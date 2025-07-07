// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_secret_dto.freezed.dart';
part 'monolith_secret_dto.g.dart';

@freezed
abstract class MonolithSecretDto with _$MonolithSecretDto {
  const factory MonolithSecretDto({
    @JsonKey(name: 'path') String? path,
    @JsonKey(name: 'base64_file') String? base64File,
    @JsonKey(name: 'text_file') String? textFile,
    @JsonKey(name: 'properties') Map<String, String>? properties,
  }) = _MonolithSecretDto;

  factory MonolithSecretDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithSecretDtoFromJson(json);
}
