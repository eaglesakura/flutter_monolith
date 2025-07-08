// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_xcodegen_dto.freezed.dart';
part 'monolith_xcodegen_dto.g.dart';

@freezed
abstract class MonolithXcodegenDto with _$MonolithXcodegenDto {
  const factory MonolithXcodegenDto({
    /// パッケージ名
    @JsonKey(name: 'package_name') required String packageName,

    /// 事前にtouchするファイル.
    /// ファイルが作られていない場合、空ファイルを作成する.
    @JsonKey(name: 'touch_files') List<String>? touchFiles,

    /// 環境変数
    @JsonKey(name: 'env') Map<String, String>? env,
  }) = _MonolithXcodegenDto;

  factory MonolithXcodegenDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithXcodegenDtoFromJson(json);
}
