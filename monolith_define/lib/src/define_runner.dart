import 'dart:convert';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/monolith.dart';
import 'package:monolith_define/src/dto/monolith_defines_dto.dart';
import 'package:monolith_define/src/generator/defines_generator.dart';
import 'package:monolith_define/src/generator/defines_generator_template.dart';
import 'package:path/path.dart' as p;

final _log = Logger.file();

extension MonolithDefineExtension on Monolith {
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
      final jsonFile = relativeFile(p.join(outputPath, '$flavorName.json'));

      _log.i('flavor: $flavorName :: ${jsonFile.path}');
      for (final key in keyValues.keys) {
        _log.i('  - $key');
      }

      jsonFile.writeAsStringSync(jsonEncode(keyValues));
      generator.addAll(keyValues.keys);
    }

    final dartFile = packageName.relativeFile(helperPath);
    generator.generate(
      dartFile,
      definesMustache: mustache,
      pathToTestDefineJson: p.join(outputPath, '$testFlavor.json'),
    );

    await project.shell(
      'dart',
      arguments: [
        'format',
        dartFile.path,
      ],
    );
  }
}
