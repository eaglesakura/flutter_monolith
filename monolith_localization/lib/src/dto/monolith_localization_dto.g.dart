// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_localization_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithLocalizationDto _$MonolithLocalizationDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithLocalizationDto(
  languages: (json['languages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  app: MonolithLocalizationAppDto.fromJson(json['app'] as Map<String, dynamic>),
  package: MonolithLocalizationPackageDto.fromJson(
    json['package'] as Map<String, dynamic>,
  ),
  testHelper: json['test_helper'] == null
      ? null
      : MonolithLocalizationTestHelperDto.fromJson(
          json['test_helper'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MonolithLocalizationDtoToJson(
  _MonolithLocalizationDto instance,
) => <String, dynamic>{
  'languages': instance.languages,
  'app': instance.app,
  'package': instance.package,
  'test_helper': instance.testHelper,
};
