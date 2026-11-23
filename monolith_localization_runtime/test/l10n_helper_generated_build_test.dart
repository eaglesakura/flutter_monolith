import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

import 'support/example_l10n_helper.dart';
import 'support/stub_l10n.dart';

void main() {
  group('generated L10nHelper build', () {
    tearDown(() {
      LocalizeStringDelegate.delegate = (source) => source.id;
    });

    test('material_ui 依存の生成物パターンがコンパイル・利用できる', () async {
      expect(
        L10nHelper.localizationsDelegates,
        isNotEmpty,
      );
      expect(
        L10nHelper.localizationsDelegates.first,
        same(L10nHelper.delegate),
      );
      expect(L10nHelper.supportedLocales, L10n.supportedLocales);

      final l10n = await L10n.delegate.load(const Locale('en'));
      L10nHelper.configure(l10n);

      expect(LocalizeStringDelegate.get('hello'), 'Hello');
      expect(
        LocalizeStringDelegate.get('greet', arguments: const ['Ada']),
        'Hello Ada',
      );
    });

    test('LocalizationsDelegate としてロードできる', () async {
      expect(L10nHelper.delegate.isSupported(const Locale('ja')), isTrue);
      expect(L10nHelper.delegate.isSupported(const Locale('fr')), isFalse);

      final loaded = await L10nHelper.delegate.load(const Locale('ja'));
      expect(loaded.hello, 'Hello');
      expect(LocalizeStringDelegate.get('hello'), 'Hello');
    });
  });
}
