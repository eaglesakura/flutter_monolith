import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:mustache_template/mustache.dart';

/// --define で渡した値の定数を生成するジェネレータ.
class DefinesGenerator {
  final keys = <String>{};

  DefinesGenerator();

  /// 定数を追加する.
  void addAll(Iterable<String> keys) => this.keys.addAll(keys);

  /// defines.dartを生成する.
  void generate(
    File outputDartFile, {

    /// template
    required String definesMustache,

    /// path/to/test.json
    required String pathToTestDefineJson,
  }) {
    final mustacheValues = {
      'relativePathToTestDefinesJson': pathToTestDefineJson,
      ..._compileMustacheValues(),
    };

    final template = Template(definesMustache);
    final renderString = template.renderString(mustacheValues);

    // ディレクトリを作成
    if (!outputDartFile.parent.existsSync()) {
      outputDartFile.parent.createSync(recursive: true);
    }
    outputDartFile.writeAsStringSync(renderString);
  }

  /// Mustacheテンプレート引数を生成する.
  Map<String, dynamic> _compileMustacheValues() {
    return <String, dynamic>{
      'keys': keys.toList().sorted(),
    };
  }
}
