import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:monolith_localization_runtime/src/localize_string_delegate.dart';

void main() {
  final fixtureFile = File('test/fixtures/test_ja.arb');

  setUp(() async {
    await LocalizeStringDelegate.injectDelegateForTest(
      arbJson: await fixtureFile.readAsString(),
    );
  });

  tearDown(() async {
    await LocalizeStringDelegate.resetDelegateForTest();
  });

  group('injectDelegateForTest', () {
    test('引数なし', () {
      expect(LocalizeStringDelegate.get('no_argument'), 'OK');
    });

    test('引数1', () {
      expect(
        LocalizeStringDelegate.get('one_argument', arguments: ['太郎']),
        'こんにちは 太郎',
      );
    });

    test('引数2', () {
      expect(
        LocalizeStringDelegate.get(
          'two_arguments',
          arguments: ['山田', '太郎'],
        ),
        '山田太郎さん',
      );
    });

    test('存在しないIDは例外を投げる', () {
      expect(
        () => LocalizeStringDelegate.get('unknown'),
        throwsA(isA<StateError>()),
      );
    });

    test('resetDelegateForTest後はIDを返す', () async {
      await LocalizeStringDelegate.resetDelegateForTest();

      expect(LocalizeStringDelegate.get('no_argument'), 'no_argument');
    });
  });

  test('不正なJSONのARBはFormatExceptionを投げる', () async {
    await expectLater(
      LocalizeStringDelegate.injectDelegateForTest(arbJson: 'not json'),
      throwsA(isA<FormatException>()),
    );
  });
}
