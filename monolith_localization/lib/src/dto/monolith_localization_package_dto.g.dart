// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_localization_package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithLocalizationPackageDto _$MonolithLocalizationPackageDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithLocalizationPackageDto(
  pathPrefixes: (json['path_prefixes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  resourcesPath: json['resources_path'] as String? ?? 'res/',
  moduleHelperClassName:
      json['module_helper_class_name'] as String? ?? 'L10nStringsMixin',
  moduleHelperPath:
      json['module_helper_path'] as String? ?? 'lib/gen/strings.dart',
);

Map<String, dynamic> _$MonolithLocalizationPackageDtoToJson(
  _MonolithLocalizationPackageDto instance,
) => <String, dynamic>{
  'path_prefixes': instance.pathPrefixes,
  'resources_path': instance.resourcesPath,
  'module_helper_class_name': instance.moduleHelperClassName,
  'module_helper_path': instance.moduleHelperPath,
};
