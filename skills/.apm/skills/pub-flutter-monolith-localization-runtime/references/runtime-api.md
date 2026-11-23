# LocalizeStringDelegate（Example: TODO アプリ）

## 主な API

| API | 用途 |
| --- | --- |
| `LocalizeStringDelegate.format` | 取得文字列の後処理フック |
| `injectDelegateForTest` | Test / Preview / Golden 向けに ARB JSON を注入 |
| `resetDelegateForTest` | 注入の解除 |
| `get` | ID から文字列を解決（テスト検証など） |

## inject の典型

Widget Preview:

```dart
await LocalizeStringDelegate.injectDelegateForTest(
  arbJson: StringsTestHelper.ja,
);
```

Golden:

```dart
Future<void> injectTodoGoldenLocalization() {
  return LocalizeStringDelegate.injectDelegateForTest(
    arbJson: StringsTestHelper.ja,
  );
}
```

## DO / DO NOT

### DO

* テスト開始時に inject、終了時に reset
* 生成ヘルパー（`StringsTestHelper`）があるならそれを使う

### DO NOT

* リリース画面から `StringsTestHelper` や `injectDelegateForTest` に依存する
* 生成系パッケージ（monolith_localization）をアプリ runtime 依存に足す必要はない
  （runtime パッケージだけで足りる）
