import 'dart:io';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:grinder/grinder.dart';
import 'package:meta/meta.dart';
import 'package:monolith/src/monolith.dart';
import 'package:monolith/src/monolith_options.dart';
import 'package:monolith/src/package/dart_package.dart';
import 'package:path/path.dart' as p;

/// Dartのpackageを処理するクラス.
class DartPackageRunner {
  final DartPackage package;

  @internal
  final Monolith monolith;

  final Logger _log;

  @internal
  DartPackageRunner({
    required this.package,
    required this.monolith,
  }) : _log = Logger.tag(package.name);

  /// バージョン名をビルド番号に簡易変換する.
  /// 1.2.3+4 -> [001][002][003][004] -> 1002003004
  int get buildNumber {
    const multiply = 1000;
    // 1.2.3+4 -> 1002003004
    final major = int.parse(version.split('.')[0]);
    final minor = int.parse(version.split('.')[1]);
    final patch = int.parse(version.split('.')[2].split('+')[0]);
    final build = int.parse(version.split('+')[1]);
    return (major * multiply * multiply * multiply) +
        (minor * multiply * multiply) +
        (patch * multiply) +
        build;
  }

  /// package名.
  String get name => package.name;

  /// packageのバージョン.
  String get version => package.version;

  MonolithOptions get _options => monolith.options;

  /// dart analyzeを実行する.
  Future analyze() async {
    return exec('dart', arguments: ['analyze']);
  }

  Future pubGet() async {
    if (package.isFlutter) {
      return exec('flutter', arguments: ['pub', 'get']);
    } else {
      return exec('dart', arguments: ['pub', 'get']);
    }
  }

  /// flutter cleanを実行する.
  Future clean() async {
    if (package.isFlutter) {
      return exec('flutter', arguments: ['clean']);
    }
  }

  /// package配下のディレクトリを取得する.
  Directory directory(String path) =>
      Directory(p.normalize(p.join(package.directory.path, path)));

  /// 指定したコマンドを実行する.
  Future<String> exec(
    String executable, {
    String? relativeWorkingDirectory,
    required List<String> arguments,
    Map<String, String>? environment,
  }) async {
    final workingDirectory = p.join(
      package.directory.path,
      relativeWorkingDirectory ?? '',
    );

    final runOptions = RunOptions(
      includeParentEnvironment: true,
      environment: environment,
    );

    _log.i('exec: $executable $arguments');

    if (_options.useMise) {
      return runAsync(
        'mise',
        arguments: [
          'exec',
          '--',
          executable,
          ...arguments,
        ],
        workingDirectory: workingDirectory,
        runOptions: runOptions,
      );
    } else {
      return runAsync(
        executable,
        arguments: arguments,
        workingDirectory: workingDirectory,
        runOptions: runOptions,
      );
    }
  }

  /// package配下のファイルを取得する.
  File file(String path) =>
      File(p.normalize(p.join(package.directory.path, path)));

  /// dart formatを実行する.
  Future format() async {
    for (final dir in ['lib/', 'test/']) {
      final target = Directory(p.join(package.directory.path, dir));
      if (target.existsSync()) {
        await exec(
          'dart',
          arguments: ['format', dir],
        );
      }
    }
  }

  /// コードフォーマッタを実行し、未設定のファイルがあればエラーを出力する.
  Future validateFormat() async {
    _log.i('dart format $name');
    for (final dir in ['lib/', 'test/']) {
      final target = directory(dir);
      if (target.existsSync()) {
        await exec(
          'dart',
          arguments: [
            'format',
            dir,
            '--set-exit-if-changed',
          ],
        );
      }
    }
  }

  /// build_runnerを実行する
  Future runBuildRunner() async {
    if (!package.containsDevDependencies('build_runner')) {
      _log.i('skip build_runner');
      return;
    }

    _log.i('dart build_runner ${package.name}');

    await exec(
      'dart',
      arguments: [
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs',
      ],
      relativeWorkingDirectory: package.directory.path,
    );

    final libDirectory = Directory(p.join(package.directory.path, 'lib'));
    if (libDirectory.existsSync()) {
      libDirectory
          .listSync(recursive: true)
          .where((entity) => entity.path.endsWith('.freezed.dart'))
          .whereType<File>()
          .forEach((file) {
            // freezed出力時、Unionで異なる型・同一プロパティ名があると
            // "InvalidType" という型名が生成されるため、dynamicに変換する
            final content = file.readAsStringSync().replaceAll(
              'InvalidType',
              'dynamic',
            );
            file.writeAsStringSync(content);
          });
    }
    await format();
  }

  /// dart testを実行する.
  Future<String> test() async {
    if (package.hasTests) {
      if (package.isFlutter) {
        return exec('flutter', arguments: ['test']);
      } else {
        return exec('dart', arguments: ['test']);
      }
    } else {
      return '';
    }
  }
}
