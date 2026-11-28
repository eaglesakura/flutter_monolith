---
name: flutter-use-monolith-localization-runtime
description: >-
  monolith_localization_runtime の実行時 API（LocalizeStringDelegate、
  テキスト整形、injectDelegateForTest / resetDelegateForTest）の利用ガイド。
  テストや Widget Preview での文言注入、実行時の文字列整形カスタム、
  「LocalizeStringDelegate を設定して」では必ず使う。
  CSV 編集・コード生成手順そのものは flutter-use-monolith-localization を使う。
---
# monolith_localization_runtime / 実行時

`monolith_localization` が生成したコードを、アプリ実行時・テスト時に支えるランタイムである。
文言の真実源や生成手順は `flutter-use-monolith-localization` を正とする。

## 使わないか

* `strings.csv` の編集・生成コマンド（→ `flutter-use-monolith-localization`）
* Flavor / dart-define（→ `flutter-use-monolith-define`）

## 依存

```yaml
# 文言を参照する package の pubspec.yaml
dependencies:
  monolith_localization_runtime: ^1.1.0
```

## アプリ統合（Example: TODO アプリ）

生成された `L10nHelper` を Flutter のローカライズ API に渡す。
`L10nHelper` は monolith が生成し、`material_ui` を import する（出力先 package に依存が必要）。

```dart
import 'package:app/l10n/l10n_helper.dart';
import 'package:material_ui/material_ui.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10nHelper.localizationsDelegates,
      supportedLocales: L10nHelper.supportedLocales,
      home: const TodoListPage(),
    );
  }
}
```

package 内の文言参照は、生成 Mixin を mixin した `strings` 経由で行う
（詳細は localization SKILL）。

## テキスト整形のカスタム

```dart
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

Future<void> main() async {
  LocalizeStringDelegate.format = _formatStringResource;
  // runApp ...
}

String _formatStringResource({
  required String id,
  required List<String> arguments,
  required String originalFormattedText,
}) {
  return originalFormattedText.replaceAll(r'\n', '\n');
}
```

## テスト注入

```dart
import 'package:foundation_resources/gen/strings_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

void main() {
  setUpAll(() async {
    await LocalizeStringDelegate.injectDelegateForTest(
      arbJson: StringsTestHelper.ja,
    );
  });

  tearDownAll(() async {
    await LocalizeStringDelegate.resetDelegateForTest();
  });

  test('空一覧の文言', () {
    expect(
      LocalizeStringDelegate.get('domain_todo_todo_empty'),
      'まだ項目がありません',
    );
  });
}
```

`StringsTestHelper` の生成条件・DO NOT は localization SKILL の references を読む。
代替として ARB 文字列を直接渡すこともできるが、ヘルパーがある構成ではそちらを優先する。

詳細は [references/runtime-api.md](./references/runtime-api.md) を読む。
