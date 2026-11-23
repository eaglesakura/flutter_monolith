// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_localization_test_helper_dto.freezed.dart';
part 'monolith_localization_test_helper_dto.g.dart';

/// Unit Test / Widget Preview 向け StringsTestHelper 生成設定.
///
/// `monolith.yaml` の `localization.test_helper` に対応する.
/// 省略時は親 DTO の `testHelper` が null となり、ヘルパー生成をスキップする.
@internal
@freezed
abstract class MonolithLocalizationTestHelperDto
    with _$MonolithLocalizationTestHelperDto {
  const factory MonolithLocalizationTestHelperDto({
    /// 出力先パッケージ名（workspace 上で解決できること）.
    @JsonKey(name: 'package_name') required String packageName,

    /// 生成クラス名.
    ///
    /// 省略時は `StringsTestHelper`.
    /// Dart クラス識別子（`^[A-Z][a-zA-Z0-9_]*$`）であること.
    /// 不正時は生成前に [FormatException] を投げる.
    @JsonKey(name: 'test_helper_class_name')
    @Default('StringsTestHelper')
    String testHelperClassName,

    /// 出力先パッケージルートからの相対パス.
    ///
    /// 省略時は `lib/gen/strings_test_helper.dart`.
    @JsonKey(name: 'test_helper_path')
    @Default('lib/gen/strings_test_helper.dart')
    String testHelperPath,
  }) = _MonolithLocalizationTestHelperDto;

  factory MonolithLocalizationTestHelperDto.fromJson(
    Map<String, dynamic> json,
  ) => _$MonolithLocalizationTestHelperDtoFromJson(json);
}
