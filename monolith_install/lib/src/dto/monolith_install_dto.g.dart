// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_install_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithInstallDto _$MonolithInstallDtoFromJson(Map<String, dynamic> json) =>
    _MonolithInstallDto(
      path: json['path'] as String?,
      base64File: json['base64_file'] as String?,
      textFile: json['text_file'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$MonolithInstallDtoToJson(_MonolithInstallDto instance) =>
    <String, dynamic>{
      'path': instance.path,
      'base64_file': instance.base64File,
      'text_file': instance.textFile,
      'properties': instance.properties,
    };
