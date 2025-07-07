import 'package:freezed_annotation/freezed_annotation.dart';

part 'defines_options.freezed.dart';

@freezed
abstract class DefinesOptions with _$DefinesOptions {
  const factory DefinesOptions({
    /// 定義クラスのテンプレートファイル.
    /// 未指定の場合、デフォルトのテンプレートファイルを使用する.
    String? definesClassTemplateMustache,
  }) = _DefinesOptions;
}
