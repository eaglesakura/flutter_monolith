// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_localization_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithLocalizationDto _$MonolithLocalizationDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithLocalizationDto(
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  moduleHelperClassName: json['module_helper_class_name'] as String?,
  moduleHelperPath: json['module_helper_path'] as String?,
  arbPath: json['arb_path'] as String?,
  l10nHelperClassName: json['l10n_helper_class_name'] as String?,
  arbFilePrefix: json['arb_file_prefix'] as String?,
  l10nHelperPath: json['l10n_helper_path'] as String?,
);

Map<String, dynamic> _$MonolithLocalizationDtoToJson(
  _MonolithLocalizationDto instance,
) => <String, dynamic>{
  'languages': instance.languages,
  'module_helper_class_name': instance.moduleHelperClassName,
  'module_helper_path': instance.moduleHelperPath,
  'arb_path': instance.arbPath,
  'l10n_helper_class_name': instance.l10nHelperClassName,
  'arb_file_prefix': instance.arbFilePrefix,
  'l10n_helper_path': instance.l10nHelperPath,
};
