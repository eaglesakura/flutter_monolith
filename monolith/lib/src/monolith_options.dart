import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monolith_options.freezed.dart';

@freezed
abstract class MonolithOptions with _$MonolithOptions {
  const factory MonolithOptions({
    /// monolith.yamlのパス.
    /// nullの場合、カレントディレクトリをルートとして `monolith.yaml` を読み込む.
    File? monolith,
  }) = _MonolithOptions;
}
