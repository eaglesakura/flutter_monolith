// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_localization_app_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithLocalizationAppDto _$MonolithLocalizationAppDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithLocalizationAppDto(
  packageName: json['package_name'] as String,
  arbPath: json['arb_path'] as String? ?? 'lib/l10n/',
  arbFilePrefix: json['arb_file_prefix'] as String? ?? 'intl_app_',
  l10nHelperClassName:
      json['l10n_helper_class_name'] as String? ?? 'L10nHelper',
  l10nHelperPath:
      json['l10n_helper_path'] as String? ?? 'lib/l10n/l10n_helper.dart',
);

Map<String, dynamic> _$MonolithLocalizationAppDtoToJson(
  _MonolithLocalizationAppDto instance,
) => <String, dynamic>{
  'package_name': instance.packageName,
  'arb_path': instance.arbPath,
  'arb_file_prefix': instance.arbFilePrefix,
  'l10n_helper_class_name': instance.l10nHelperClassName,
  'l10n_helper_path': instance.l10nHelperPath,
};
