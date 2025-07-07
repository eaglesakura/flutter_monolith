import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/src/package/dart_package_runner.dart';
import 'package:monolith/src/xcodegen/dto/monolith_xcodegen_dto.dart';

final _log = Logger.file();

extension DartPackageRunnerXcodegenExtensions on DartPackageRunner {
  MonolithXcodegenDto _parseConfiguration() {
    final xcodegen = monolith.configurations['xcodegen'];
    if (xcodegen == null) {
      return const MonolithXcodegenDto();
    }
    return MonolithXcodegenDto.fromJson(xcodegen as Map<String, dynamic>);
  }

  /// xcodegenを実行する.
  Future<void> runXcodegen() async {
    final dto = _parseConfiguration();
    final env = dto.env ?? {};
    final touchFiles = dto.touchFiles ?? [];

    _log.i('xcodegen');
    _log.i('  - touchFiles: ${touchFiles.join(', ')}');
    _log.i('  - env: ${env.keys.join(', ')}');

    for (final touchFile in touchFiles) {
      final tf = file(touchFile);
      if (!tf.existsSync()) {
        _log.i('touch: ${tf.path}');
        tf.createSync();
      }
    }

    await pubGet();
    await exec(
      'xcodegen',
      arguments: [],
      environment: env,
      relativeWorkingDirectory: 'ios',
    );
  }
}
