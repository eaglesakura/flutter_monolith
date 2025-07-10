import 'package:monolith_localization/monolith_localization.dart';
import 'package:monolith_runner/src/monolith_runner_arguments.dart';

Future<int> main(List<String> args) async {
  final arguments = MonolithRunnerArguments.configure(args);
  final monolith = arguments.monolith;
  await monolith.generateLocalization();
  return 0;
}
