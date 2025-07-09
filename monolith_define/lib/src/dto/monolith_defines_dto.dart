// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith_define/src/dto/monolith_defines_generate_dto.dart';

part 'monolith_defines_dto.freezed.dart';
part 'monolith_defines_dto.g.dart';

@freezed
abstract class MonolithDefinesDto with _$MonolithDefinesDto {
  const factory MonolithDefinesDto({
    @JsonKey(name: 'output_path') required String outputPath,
    @JsonKey(name: 'generate') required MonolithDefinesGenerateDto generate,
    @JsonKey(name: 'flavors') required Map<String, Map<String, String>> flavors,
  }) = _MonolithDefinesDto;

  factory MonolithDefinesDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithDefinesDtoFromJson(json);
}
