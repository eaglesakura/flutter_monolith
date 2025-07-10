import 'package:monolith_runner/src/monolith_runner_arguments.dart';
import 'package:monolith_xcodegen/monolith_xcodegen.dart';

Future<int> main(List<String> args) async {
  final arguments = MonolithRunnerArguments.configure(args);
  final monolith = arguments.monolith;
  await monolith.runXcodegen();
  return 0;
}
