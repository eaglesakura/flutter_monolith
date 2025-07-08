import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/src/monolith.dart';
import 'package:monolith/src/package/dart_package_runner.dart';
import 'package:monolith/src/xcodegen/dto/monolith_xcodegen_dto.dart';

final _log = Logger.file();

extension MonolithRunXcodegenExtensions on Monolith {
  MonolithXcodegenDto _parseConfiguration() {
    final xcodegen = configurations['xcodegen'];
    return MonolithXcodegenDto.fromJson(xcodegen as Map<String, dynamic>);
  }

  /// xcodegenを実行する.
  Future<void> runXcodegen() async {
    final dto = _parseConfiguration();
    final pkg = require(dto.packageName);
    final env = dto.env ?? {};
    final touchFiles = dto.touchFiles ?? [];

    _log.i('xcodegen');
    _log.i('  - package: ${pkg.name}');
    _log.i('  - touchFiles: ${touchFiles.join(', ')}');
    _log.i('  - env: ${env.keys.join(', ')}');

    for (final touchFile in touchFiles) {
      final tf = pkg.relativeFile(touchFile);
      if (!tf.existsSync()) {
        _log.i('touch: ${tf.path}');
        tf.createSync();
      }
    }

    await pkg.pubGet();
    await pkg.exec(
      'xcodegen',
      arguments: [],
      environment: env,
      relativeWorkingDirectory: 'ios',
    );
  }
}
