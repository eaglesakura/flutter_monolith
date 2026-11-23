import 'package:material_ui/material_ui.dart';

/// gen-l10n が出力する L10n の最小スタブ（生成物ビルド検証用）.
class L10n {
  const L10n._();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  String get hello => 'Hello';

  String greet(String name) => 'Hello $name';
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  bool isSupported(Locale locale) {
    return L10n.supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    );
  }

  @override
  Future<L10n> load(Locale locale) async => const L10n._();

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) => false;
}
