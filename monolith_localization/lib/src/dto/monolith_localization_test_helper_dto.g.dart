// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_localization_test_helper_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithLocalizationTestHelperDto _$MonolithLocalizationTestHelperDtoFromJson(
  Map<String, dynamic> json,
) => _MonolithLocalizationTestHelperDto(
  packageName: json['package_name'] as String,
  testHelperClassName:
      json['test_helper_class_name'] as String? ?? 'StringsTestHelper',
  testHelperPath:
      json['test_helper_path'] as String? ?? 'lib/gen/strings_test_helper.dart',
);

Map<String, dynamic> _$MonolithLocalizationTestHelperDtoToJson(
  _MonolithLocalizationTestHelperDto instance,
) => <String, dynamic>{
  'package_name': instance.packageName,
  'test_helper_class_name': instance.testHelperClassName,
  'test_helper_path': instance.testHelperPath,
};
