// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dart_package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DartPackageDto _$DartPackageDtoFromJson(Map<String, dynamic> json) =>
    DartPackageDto(
      name: json['name'] as String?,
      workspace: (json['workspace'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DartPackageDtoToJson(DartPackageDto instance) =>
    <String, dynamic>{'name': instance.name, 'workspace': instance.workspace};
