import 'dart:convert';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/src/install/dto/monolith_installs_dto.dart';
import 'package:monolith/src/monolith.dart';

final _log = Logger.file();

/// `install` プロパティの設定に従って、ファイルをインストールする.
extension MonolithInstallExtensions on Monolith {
  MonolithInstallsDto _parseConfiguration() {
    return MonolithInstallsDto.fromJson(configurations);
  }

  /// `secrets` プロパティの設定に従って、シークレットファイルをインストールする.
  /// 事前にop等のコマンドを使用して、シークレット情報はconfigurationsに読み込まれている必要がある.
  Future runInstall() async {
    final installs = _parseConfiguration().installs ?? const [];

    for (final install in installs) {
      final base64File = install.base64File;
      final textFile = install.textFile;
      final path = install.path;
      if (base64File != null) {
        final dst = file(path!);
        _log.i('write file(base64): ${dst.path}');
        if (dst.existsSync()) {
          _log.i('  - overwrite');
        }
        dst.writeAsBytesSync(base64Decode(base64File));
      } else if (textFile != null) {
        final dst = file(path!);
        _log.i('write file(text): ${dst.path}');
        if (dst.existsSync()) {
          _log.i('  - overwrite');
        }
        dst.writeAsStringSync(textFile);
      }
    }
  }
}
