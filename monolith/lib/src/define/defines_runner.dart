import 'dart:convert';

import 'package:monolith/src/define/dto/monolith_defines_dto.dart';
import 'package:monolith/src/define/generator/defines_generator.dart';
import 'package:monolith/src/define/generator/defines_generator_template.dart';
import 'package:monolith/src/monolith.dart';
import 'package:path/path.dart' as p;

extension MonolithDefinesExtension on Monolith {
  MonolithDefinesDto _parseConfiguration() {
    final defines = configurations['define'];
    return MonolithDefinesDto.fromJson(defines as Map<String, dynamic>);
  }

  /// dart-define用のJSONファイルと、アクセス補助用のクラスを生成する.
  Future<void> generateDefine() async {
    final defines = _parseConfiguration();
    final generate = defines.generate;

    final packageName = require(generate.packageName);
    final helperPath = generate.helperPath;
    final outputPath = defines.outputPath;
    final flavors = defines.flavors;
    final testFlavor = generate.testFlavor;
    const mustache = definesClassTemplateMustache;

    // Define classを生成
    final generator = DefinesGenerator();
    for (final flavor in flavors.entries) {
      final flavorName = flavor.key;
      final keyValues = flavor.value;
      final jsonFile = file(p.join(outputPath, '$flavorName.json'));

      jsonFile.writeAsStringSync(jsonEncode(keyValues));
      generator.addAll(keyValues.keys);
    }

    final dartFile = packageName.file(helperPath);
    generator.generate(
      dartFile,
      definesMustache: mustache,
      pathToTestDefineJson: p.join(outputPath, '$testFlavor.json'),
    );

    await project.exec(
      'dart',
      arguments: [
        'format',
        dartFile.path,
      ],
    );
  }
}
