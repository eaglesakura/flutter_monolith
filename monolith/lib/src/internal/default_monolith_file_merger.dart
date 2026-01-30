import 'dart:io';

import 'package:armyknife_dartx/armyknife_dartx.dart';
import 'package:armyknife_yamlx/armyknife_yamlx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith/src/monolith_file_merger.dart';

@internal
class DefaultMonolithFileMerger implements MonolithFileMerger {
  const DefaultMonolithFileMerger();

  @override
  Map<String, dynamic> merge(List<File> files) {
    // 全てのYAMLをマージる
    final yamlMaps = files.map((e) => YamlX.parse(e)).toList();
    var result = <String, dynamic>{};
    for (final yamlMap in yamlMaps) {
      result = MapX.merge(result, yamlMap);
    }
    return result;
  }
}
