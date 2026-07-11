import 'package:meta/meta.dart';

/// StringsTestHelper 生成用 Mustache テンプレート.
///
/// ARB 本文は `{{{arbBase64}}}`（三重括弧）で HTML エスケープせず埋め込む.
/// 各言語 getter はリリースモード（`dart.vm.product`）で [UnsupportedError] を投げる.
@internal
const stringsTestHelperMustache = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_use_of_internal_member, implementation_imports
import 'dart:convert';

/// Unit Test / Widget Preview 向けに ARB JSON 文字列を提供する.
///
/// リリースモード（`dart.vm.product`）では getter 呼び出し時に例外を投げる.
///
/// Example:
/// ```dart
/// await LocalizeStringDelegate.injectDelegateForTest(
///   arbJson: {{className}}.ja,
/// );
/// ```
final class {{className}} {
  const {{className}}._();

{{#languages}}
  /// 言語 `{{sourceLang}}` の ARB JSON 文字列.
  ///
  /// リリースモードでは [UnsupportedError] を投げる.
  static String get {{lang}} {
    // 本番バイナリへの混入利用を防ぐ
    if (const bool.fromEnvironment('dart.vm.product')) {
      throw UnsupportedError(
        '{{className}}.{{lang}} must not be used in release mode',
      );
    }
    return utf8.decode(base64Decode(
      '{{{arbBase64}}}',
    ));
  }

{{/languages}}
}
''';
