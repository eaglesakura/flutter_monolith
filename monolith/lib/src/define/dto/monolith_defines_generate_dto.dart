// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_defines_generate_dto.freezed.dart';
part 'monolith_defines_generate_dto.g.dart';

@freezed
abstract class MonolithDefinesGenerateDto with _$MonolithDefinesGenerateDto {
  const factory MonolithDefinesGenerateDto({
    @JsonKey(name: 'helper_path') required String helperPath,
    @JsonKey(name: 'defines_path') required String definesPath,
    @JsonKey(name: 'root_file') @Default('monolith.yaml') String rootFile,
    @JsonKey(name: 'test_flavor') @Default('test') String testFlavor,
  }) = _MonolithDefinesGenerateDto;

  factory MonolithDefinesGenerateDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithDefinesGenerateDtoFromJson(json);
}
