import 'dart:convert';

import 'package:armyknife_logger/armyknife_logger.dart';
import 'package:monolith/src/monolith.dart';
import 'package:monolith/src/secret/dto/monolith_secrets_dto.dart';

final _log = Logger.file();

/// Secretsを読み込む.
extension MonolithSecretsExtensions on Monolith {
  MonolithSecretsDto _parseConfiguration() {
    return MonolithSecretsDto.fromJson(configurations);
  }

  /// `secrets` プロパティの設定に従って、シークレットファイルをインストールする.
  /// 事前にop等のコマンドを使用して、シークレット情報はconfigurationsに読み込まれている必要がある.
  Future importSecrets() async {
    final secrets = _parseConfiguration().secrets ?? const [];

    for (final secret in secrets) {
      final base64File = secret.base64File;
      final textFile = secret.textFile;
      final path = secret.path;
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
