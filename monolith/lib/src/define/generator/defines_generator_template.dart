import 'package:meta/meta.dart';

@internal
const definesClassTemplateMustache = r'''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

final class Defines {
    const Defines._();
{{#keys}}
    static String get {{.}} {
        return _get('{{.}}') ??
            const String.fromEnvironment('{{.}}');
    }
{{/keys}}

  /// ワークスペースディレクトリを検索する.
  static Directory _getWorkspace() {
    var result = Directory.current;

    /// '{{rootFileName}}'が存在するディレクトリまで遡る)
    while (true) {
      final rootFile = File('${result.path}/{{rootFileName}}');
      if (rootFile.existsSync()) {
        return result;
      }

      // 一つ上に戻る
      result = result.parent;
    }
  }

  static final _defineList = <String, String>{};

  static void _ensureInitialized() {
    if (_isFlutterTesting || _defineList.isNotEmpty) {
      return;
    }

    /// ワークスペースディレクトリを取得
    final workspace = _getWorkspace();
    final definesJson = File('${workspace.path}/{{{relativePathToTestDefinesJson}}}')
        .readAsStringSync();
    final json = jsonDecode(definesJson) as Map<String, dynamic>;
    for (final kv in json.entries) {
      _defineList[kv.key] = kv.value as String;
    }
  }

  static String? _get(String key) {
    if (_isFlutterTesting) {
      _ensureInitialized();
      return _defineList[key];
    } else {
      return null;
    }
  }

  static bool get _isFlutterTesting {
    return !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');
  }
}
''';
