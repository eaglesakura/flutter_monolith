// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_defines_generate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithDefinesGenerateDto _$MonolithDefinesGenerateDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithDefinesGenerateDto(
  helperPath: json['helper_path'] as String,
  definesPath: json['defines_path'] as String,
  rootFile: json['root_file'] as String? ?? 'monolith.yaml',
  testFlavor: json['test_flavor'] as String? ?? 'test',
);

Map<String, dynamic> _$MonolithDefinesGenerateDtoToJson(
  _MonolithDefinesGenerateDto instance,
) => <String, dynamic>{
  'helper_path': instance.helperPath,
  'defines_path': instance.definesPath,
  'root_file': instance.rootFile,
  'test_flavor': instance.testFlavor,
};
