// ignore_for_file: avoid_print

import 'package:ansicolor/ansicolor.dart';
import 'package:armyknife_logger/armyknife_logger.dart';
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
    _injectLogger();
    return MonolithRunnerArguments(
      monolith: Monolith(
        const MonolithOptions(),
      ),
    );
  }

  static void _injectLogger() {
    LoggerProxy.i = (String tag, String message) {
      final pen = AnsiPen()..green(bold: true);
      print(pen('[$tag] $message'));
    };

    LoggerProxy.w = (String tag, String message) {
      final pen = AnsiPen()..yellow(bold: true);
      print(pen('[$tag] $message'));
    };
    LoggerProxy.e =
        (String tag, String message, [dynamic error, StackTrace? stackTrace]) {
          final pen = AnsiPen()..red(bold: true);
          print(pen('[$tag] $message'));
          print(pen(error.toString()));
          print(pen(stackTrace.toString()));
        };
    LoggerProxy.d = (String tag, String message) {
      final pen = AnsiPen()..yellow(bold: true);
      print(pen('[$tag] $message'));
    };
  }
}
