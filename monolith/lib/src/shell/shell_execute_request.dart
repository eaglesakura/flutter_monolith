import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shell_execute_request.freezed.dart';

/// Shell実行のリクエスト.
@freezed
abstract class ShellExecuteRequest with _$ShellExecuteRequest {
  const factory ShellExecuteRequest({
    /// 実行するコマンド.
    required String command,

    /// 実行するコマンドの引数.
    required List<String> arguments,

    /// 実行するコマンドの環境変数.
    Map<String, String>? environment,

    /// 実行するコマンドのワーキングディレクトリ.
    Directory? workingDirectory,
  }) = _ShellExecuteRequest;
}
