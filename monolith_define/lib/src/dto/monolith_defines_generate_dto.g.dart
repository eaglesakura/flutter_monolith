// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_defines_generate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithDefinesGenerateDto _$MonolithDefinesGenerateDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithDefinesGenerateDto(
  packageName: json['package_name'] as String,
  helperPath: json['helper_path'] as String,
  testFlavor: json['test_flavor'] as String? ?? 'test',
);

Map<String, dynamic> _$MonolithDefinesGenerateDtoToJson(
  _MonolithDefinesGenerateDto instance,
) => <String, dynamic>{
  'package_name': instance.packageName,
  'helper_path': instance.helperPath,
  'test_flavor': instance.testFlavor,
};
