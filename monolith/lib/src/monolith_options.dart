import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_options.freezed.dart';

@freezed
abstract class MonolithOptions with _$MonolithOptions {
  const factory MonolithOptions({
    /// fvmコマンドを使用する
    @Default(false) bool useFvm,

    /// miseコマンドを使用する
    @Default(false) bool useMise,

    /// Dart ワークスペースのルートディレクトリ.
    Directory? workspace,

    /// monolith.yamlのリスト.
    ///
    /// 順番に読み込まれ、設定値は上書きされる.
    /// 存在しないファイルは無視される.
    required List<File> monolithFiles,
  }) = _MonolithOptions;
}
