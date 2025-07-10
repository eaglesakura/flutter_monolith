import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith/monolith.dart';

part 'monolith_runner_arguments.freezed.dart';

@freezed
abstract class MonolithRunnerArguments with _$MonolithRunnerArguments {
  factory MonolithRunnerArguments({
    /// Monolith インスタンス.
    required Monolith monolith,

    /// --verbose
    @Default(false) bool verbose,
  }) = _MonolithRunnerArguments;

  factory MonolithRunnerArguments.configure(List<String> arguments) {
    return MonolithRunnerArguments(
      monolith: Monolith(
        const MonolithOptions(),
      ),
    );
  }
}
