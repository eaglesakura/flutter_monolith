import 'dart:convert';

import 'package:monolith/src/define/defines_options.dart';
import 'package:monolith/src/define/dto/monolith_defines_dto.dart';
import 'package:monolith/src/define/generator/defines_generator.dart';
import 'package:monolith/src/define/generator/defines_generator_template.dart';
import 'package:monolith/src/monolith.dart';
import 'package:path/path.dart' as p;

extension MonolithDefinesExtension on Monolith {
  MonolithDefinesDto _parseConfiguration() {
    final defines = configurations['defines'];
    return MonolithDefinesDto.fromJson(defines as Map<String, dynamic>);
  }

  /// dart-define用のJSONファイルと、アクセス補助用のクラスを生成する.
  Future<void> generateDefines(DefinesOptions options) async {
    final defines = _parseConfiguration();
    final generate = defines.generate;

    final helperPath = generate.helperPath;
    final definesPath = generate.definesPath;
    final flavors = defines.flavors;
    final rootFile = generate.rootFile;
    final testFlavor = generate.testFlavor;
    final mustache =
        options.definesClassTemplateMustache ?? definesClassTemplateMustache;

    // Define classを生成
    final generator = DefinesGenerator();
    for (final flavor in flavors.entries) {
      final flavorName = flavor.key;
      final keyValues = flavor.value;
      final jsonFile = file(p.join(definesPath, '$flavorName.json'));

      jsonFile.writeAsStringSync(jsonEncode(keyValues));
      generator.addAll(keyValues.keys);
    }

    final dartFile = file(helperPath);
    generator.generate(
      dartFile,
      definesMustache: mustache,
      rootFileName: rootFile,
      pathToTestDefineJson: p.join(definesPath, '$testFlavor.json'),
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
