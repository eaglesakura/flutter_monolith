import 'dart:io';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:armyknife_yamlx/armyknife_yamlx.dart';
import 'package:monolith/src/monolith_options.dart';
import 'package:monolith/src/package/dart_package.dart';
import 'package:monolith/src/package/dart_package_runner.dart';
import 'package:path/path.dart' as p;

final _log = Logger.of(Monolith);

/// FlutterでのModular Monolith Workspaceの処理をサポートするクラス.
class Monolith {
  /// ワークスペースのRootパッケージ.
  final DartPackage _project;

  /// オプション.
  final MonolithOptions options;

  /// `monolith.yaml` 系ファイルから読み込んだ設定値.
  final Map<String, dynamic> configurations;

  factory Monolith(MonolithOptions options) {
    final pubspecYaml = () {
      final workspace = options.workspace;
      if (workspace != null) {
        return File(p.join(workspace.path, 'pubspec.yaml'));
      } else {
        return File(p.join(Directory.current.path, 'pubspec.yaml'));
      }
    }();
    _log.i('load workspace: ${pubspecYaml.path}');
    final workspace = DartPackage.fromFile(pubspecYaml);
    final configurations = YamlX.parseWithMerge(
      [
        ...options.monolithFiles
            .map((e) => File(p.normalize(e.absolute.path)))
            .where((e) => e.existsSync()),
      ],
    );
    return Monolith._(
      project: workspace,
      options: options,
      configurations: configurations,
    );
  }

  const Monolith._({
    required DartPackage project,
    required this.options,
    required this.configurations,
  }) : _project = project;

  /// ルートプロジェクト.
  DartPackageRunner get project =>
      DartPackageRunner(package: _project, monolith: this);

  /// ワークスペースすべてのプロジェクトを列挙する.
  /// 最初のプロジェクトは、ワークスペースのルートプロジェクト.
  Iterable<DartPackageRunner> get workspace sync* {
    yield project;
    for (final child in _project.workspaces) {
      yield DartPackageRunner(package: child, monolith: this);
    }
  }

  /// ルートプロジェクトからのディレクトリ取得
  Directory directory(String path) => project.directory(path);

  /// ワークスペースに含まれるpackageを処理する.
  Future each(Future<void> Function(DartPackageRunner runner) callback) async {
    await callback(project);
    for (final child in _project.workspaces) {
      await callback(DartPackageRunner(package: child, monolith: this));
    }
  }

  /// ルートプロジェクトからのファイル取得
  File file(String path) => project.file(path);

  /// 指定パスの設定値を取得する.
  /// 存在しない場合はnullを返す.
  T? findConfiguration<T>(List<String> path) {
    return YamlX.find<T>(configurations, path);
  }

  /// 指定ファイルが含まれるpackageを取得する.
  DartPackageRunner? findFromFocusFile(File file) {
    var directory = file.parent;
    while (directory.path.isNotEmpty) {
      final pubspec = File(p.join(directory.path, 'pubspec.yaml'));
      if (pubspec.existsSync()) {
        _log.i('pubspec: ${pubspec.path}');
        return workspace.firstWhere(
          (e) => p.equals(e.package.pubspecYaml.path, pubspec.path),
        );
      }
      directory = directory.parent.absolute;
    }
    return null;
  }

  /// 設定値を出力する.
  void printConfigurations({
    void Function(String msg)? print,
  }) {
    void printImpl(int indent, Map map) {
      for (final kv in map.entries) {
        if (kv.value is Map) {
          (print ?? _log.i)('${' ' * indent}${kv.key}:');
          printImpl(indent + 2, kv.value as Map);
        } else {
          (print ?? _log.i)('${' ' * indent}${kv.key}: ${kv.value}');
        }
      }
    }

    printImpl(0, configurations);
  }

  /// ワークスペースに含まれるpackageを取得する.
  /// 存在しない場合は例外を投げる.
  DartPackageRunner require(String name) {
    return workspace.firstWhere((e) => e.name == name);
  }

  /// 指定パスの設定値を取得する.
  T requireConfiguration<T>(List<String> path) {
    return YamlX.require<T>(configurations, path);
  }

  /// ワークスペースに含まれるpackageを処理する.
  /// 指定したpackage名がnullの場合は、ワークスペースのルートプロジェクトを処理する.
  Future<T> run<T>(
    String name,
    Future<T> Function(DartPackageRunner runner) callback,
  ) async {
    return callback(require(name));
  }
}
