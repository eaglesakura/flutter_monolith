import 'package:meta/meta.dart';

@internal
const l10nHelperMustache = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: depend_on_referenced_packages, implementation_imports, invalid_use_of_internal_member
import 'package:monolith_localization/src/localize_string_delegate.dart';
import 'package:monolith_localization/src/localize_string_source.dart';

import '{{{importL10n}}}';

/// e.g.
/// final WidgetBuilder builder;
/// 
/// Widget build(BuildContext context) {
///   L10nHelper.configure(L10n.of(context));
///   return Builder(builder);
/// }
final class {{className}} {
  const {{className}}._();

  static void configure(L10n? l10n) {
    if (l10n == null) {
      return;
    }
    final table = <String, String Function(LocalizeStringSource source)>{
{{#localizeStrings}}
      '{{id}}': (source) {
        {{#hasPlaceholders}}
        // Has Placeholders
        var index = 0;
        {{#placeholders}}String {{.}} = source.arguments[index]; index++;{{/placeholders}}
        return l10n.{{id}}({{#placeholders}}{{.}},{{/placeholders}});
        {{/hasPlaceholders}}
        {{^hasPlaceholders}}
        // No Placeholders
        return l10n.{{id}};
        {{/hasPlaceholders}}
      },
{{/localizeStrings}}
    };

    LocalizeStringDelegate.delegate = (source) {
      final id = source.id;
      final func = table[id]!;
      return func(source);
    };
  }
}

''';
