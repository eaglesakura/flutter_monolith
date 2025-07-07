import 'dart:io';

import 'package:armyknife_yamlx/armyknife_yamlx.dart';
import 'package:monolith/src/package/dto/pubspec_yaml_dto.dart';
import 'package:path/path.dart' as p;

/// Dartの1packageを示すオブジェクト.
class DartPackage {
  final File pubspecYaml;

  final PubspecYamlDto _pubspecYamlDto;

  /// pubspec.yamlの生データ
  // ignore: unused_field
  final Map<String, dynamic> _pubspecYaml;

  factory DartPackage.fromFile(File pubspecYaml) {
    final yamlMap = YamlX.parse(pubspecYaml);
    final dto = PubspecYamlDto.fromJson(yamlMap);
    return DartPackage._(
      pubspecYaml: pubspecYaml.absolute,
      pubspecYamlDto: dto,
      yamlMap: yamlMap,
    );
  }

  const DartPackage._({
    required this.pubspecYaml,
    required PubspecYamlDto pubspecYamlDto,
    required Map<String, dynamic> yamlMap,
  }) : _pubspecYamlDto = pubspecYamlDto,
       _pubspecYaml = yamlMap;

  /// ディレクトリ
  Directory get directory => pubspecYaml.parent;

  /// テストファイルが存在するかどうか.
  bool get hasTests {
    final testDirectory = Directory(p.join(directory.path, 'test'));
    if (!testDirectory.existsSync()) {
      return false;
    }

    final testFiles = testDirectory.listSync(recursive: true);
    for (final file in testFiles) {
      if (file.path.endsWith('_test.dart')) {
        return true;
      }
    }
    return false;
  }

  /// Flutterプロジェクトであればtrue.
  bool get isFlutter => containsDependencies('flutter');

  /// package名
  String get name => _pubspecYamlDto.name!;

  /// packageのバージョン.
  String get version => _pubspecYamlDto.version!;

  /// ワークスペースに含まれるpackageリスト.
  Iterable<DartPackage> get workspaces sync* {
    final workspace = _pubspecYamlDto.workspace ?? const [];
    for (final pub in workspace) {
      final child = p.join(pubspecYaml.parent.path, pub, 'pubspec.yaml');
      yield DartPackage.fromFile(File(child));
    }
  }

  /// `dependencies` に依存が含まれているかどうか.
  bool containsDependencies(String pubName) {
    return _pubspecYamlDto.dependencies?.containsKey(pubName) ?? false;
  }

  /// `dev_dependencies` に依存が含まれているかどうか.
  bool containsDevDependencies(String pubName) {
    return _pubspecYamlDto.devDependencies?.containsKey(pubName) ?? false;
  }
}
