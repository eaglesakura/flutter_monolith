import 'package:meta/meta.dart';

/// Mustache template for generating StringsTestHelper.
///
/// Embeds ARB content with `{{{arbBase64}}}` (triple braces) so HTML escaping
/// is skipped. Each language getter throws [UnsupportedError] in release mode
/// (`dart.vm.product`).
@internal
const stringsTestHelperMustache = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_use_of_internal_member, implementation_imports
import 'dart:convert';

/// Provides ARB JSON strings for unit tests and widget previews.
///
/// Throws when a getter is called in release mode (`dart.vm.product`).
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
  /// ARB JSON string for locale `{{sourceLang}}`.
  ///
  /// Throws [UnsupportedError] in release mode.
  static String get {{lang}} {
    // Prevent accidental use in production binaries.
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
