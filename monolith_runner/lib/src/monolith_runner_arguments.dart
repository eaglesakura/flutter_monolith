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
    final redPen = AnsiPen()..red(bold: true);
    final yellowPen = AnsiPen()..yellow(bold: true);
    final bluePen = AnsiPen()..blue(bold: true);

    LoggerProxy.i = (String tag, String message) {
      print('${bluePen('[$tag]')} $message');
    };

    LoggerProxy.w = (String tag, String message) {
      print(yellowPen('[$tag] $message'));
    };
    LoggerProxy.e =
        (String tag, String message, [dynamic error, StackTrace? stackTrace]) {
          print(redPen('[$tag] $message'));
          print(redPen(error.toString()));
          print(redPen(stackTrace.toString()));
        };
    LoggerProxy.d = (String tag, String message) {
      print(yellowPen('[$tag] $message'));
    };
  }
}
