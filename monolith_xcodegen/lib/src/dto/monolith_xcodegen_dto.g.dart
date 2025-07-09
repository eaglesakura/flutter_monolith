// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_xcodegen_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithXcodegenDto _$MonolithXcodegenDtoFromJson(Map<String, dynamic> json) =>
    _MonolithXcodegenDto(
      packageName: json['package_name'] as String,
      touchFiles: (json['touch_files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      env: (json['env'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$MonolithXcodegenDtoToJson(
  _MonolithXcodegenDto instance,
) => <String, dynamic>{
  'package_name': instance.packageName,
  'touch_files': instance.touchFiles,
  'env': instance.env,
};
