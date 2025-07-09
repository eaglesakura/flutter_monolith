import 'package:freezed_annotation/freezed_annotation.dart';

/// ローカライゼーションヘルパーのテンプレート.
@internal
const l10nStringsMixinMustache = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_use_of_internal_member, implementation_imports
import 'package:monolith_localization_runtime/src/localize_string_delegate.dart';

/// e.g.
/// class _Strings with {{className}} {}
/// @internal
/// final strings = _Strings();
mixin class {{className}} {
  const {{className}}();
{{#localizeStrings}}
    /// {{description}}
    {{#hasPlaceholders}}
    String {{id}}({
    {{#placeholders}}required String {{.}},{{/placeholders}}
    }) => LocalizeStringDelegate.get('{{id}}', arguments: [{{#placeholders}}{{.}},{{/placeholders}}]);
    {{/hasPlaceholders}}
    {{^hasPlaceholders}}
    String get {{id}} => LocalizeStringDelegate.get('{{id}}');
    {{/hasPlaceholders}}
{{/localizeStrings}}
}
''';
