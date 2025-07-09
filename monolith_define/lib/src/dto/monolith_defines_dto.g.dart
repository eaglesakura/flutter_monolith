// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_defines_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithDefinesDto _$MonolithDefinesDtoFromJson(Map<String, dynamic> json) =>
    _MonolithDefinesDto(
      outputPath: json['output_path'] as String,
      generate: MonolithDefinesGenerateDto.fromJson(
        json['generate'] as Map<String, dynamic>,
      ),
      flavors: (json['flavors'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$MonolithDefinesDtoToJson(_MonolithDefinesDto instance) =>
    <String, dynamic>{
      'output_path': instance.outputPath,
      'generate': instance.generate,
      'flavors': instance.flavors,
    };
