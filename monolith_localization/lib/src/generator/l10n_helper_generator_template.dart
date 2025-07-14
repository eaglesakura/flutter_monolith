import 'package:meta/meta.dart';

@internal
const l10nHelperMustache = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: depend_on_referenced_packages, implementation_imports, invalid_use_of_internal_member
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:monolith_localization_runtime/src/localize_string_delegate.dart';
import 'package:monolith_localization_runtime/src/localize_string_source.dart';

import '{{{importL10n}}}';

/// e.g.
/// localizationsDelegates: [
///   {{className}}.delegate,
///   GlobalMaterialLocalizations.delegate,
///   GlobalCupertinoLocalizations.delegate,
///   GlobalWidgetsLocalizations.delegate,
/// ]
final class {{className}} {
  const {{className}}._();

  /// L10n Delegate instance.
  static const delegate = _{{className}}Delegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const supportedLocales = L10n.supportedLocales;

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

class _{{className}}Delegate implements LocalizationsDelegate<L10n> {
  final delegate = L10n.delegate;

  const _{{className}}Delegate();

  @override
  Type get type => delegate.type;

  @override
  bool isSupported(Locale locale) => delegate.isSupported(locale);

  @override
  Future<L10n> load(Locale locale) async {
    final result = await delegate.load(locale);
    L10nHelper.configure(result);
    return result;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) => false;
}
''';
