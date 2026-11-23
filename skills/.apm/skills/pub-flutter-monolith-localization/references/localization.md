# ローカライゼーション（Example: TODO アプリ）

旧 `flutter-monolith-localization` の内容を、プロダクト固有名を除いて再構成した正本である。

## 概要

* 内部的には Flutter 標準の `*.arb` と gen-l10n を利用する
* 開発者が管理するのは主に `strings*.csv`
* コード生成により型安全なアクセサ（`L10nStringsMixin`）と `L10nHelper` が提供される

## 仕組み

1. 各パッケージの `resources_path`（既定 `res/`）配下を再帰走査し、`strings` で始まり `.csv` で終わるファイルを読む
2. `dart run monolith_runner:localization` を実行する
3. 全パッケージの CSV が集約され、`localization.app.package_name`（例: `app`）の `arb_path` へ ARB が出力される
4. 各パッケージに `module_helper_path`（既定 `lib/gen/strings.dart`）の `L10nStringsMixin` が生成される
5. 出力先 package で `pub get`（`flutter: generate: true`）により gen-l10n が `L10n` 等を生成する
6. 続けて monolith の `L10nHelperGenerator` が `l10n_helper_path` へ `L10nHelper` を生成する（gen-l10n の成果物ではない）

## monolith.yaml（必須と任意）

`languages` / `app` / `package` は **必須**。`test_helper` のみ省略可。

```yaml
localization:
  languages:                 # required
    - ja
    - en
  app:                       # required
    package_name: app        # required
    arb_path: lib/l10n/      # optional, default
    arb_file_prefix: intl_app_
    l10n_helper_class_name: L10nHelper
    l10n_helper_path: lib/l10n/l10n_helper.dart
  package:                   # required
    path_prefixes:           # required
      - app/
      - packages/
    resources_path: res/     # optional, default
    module_helper_class_name: L10nStringsMixin
    module_helper_path: lib/gen/strings.dart
  # optional — 省略時は StringsTestHelper を生成しない
  test_helper:
    package_name: foundation_resources
    test_helper_class_name: StringsTestHelper
    test_helper_path: lib/gen/strings_test_helper.dart
```

## strings.csv

* 探索: `<package>/{resources_path}/` 配下を再帰し、`strings*.csv`（例: `strings.csv`, `strings_extra.csv`）
* ヘッダー: `id,ja,description`（必要に応じて `en` 等を追加）

```csv
id,ja,en,description
todo_title,やること,Todo,TODO のタイトル欄
todo_empty,まだ項目がありません,No todos yet,空一覧のメッセージ
validation_title_required,タイトルは必須です,Title is required,入力バリデーション
```

### ID とプレフィックス

* 実行時キーは `{pubspec.name}_{csv_id}` になる（package 間の衝突を避ける）
* 例: package `domain_todo` に `todo_title` → アクセサ `domain_todo_todo_title`

## コード生成

```bash
dart run monolith_runner:localization
```

## strings.dart（手書き）

```dart
import 'package:domain_todo/gen/strings.dart';
import 'package:meta/meta.dart';

final class _Strings with L10nStringsMixin {}

@internal
final strings = _Strings();
```

```dart
import 'package:domain_todo/src/strings.dart';

String emptyMessage() => strings.domain_todo_todo_empty;
```

* `export` しない。package ごとに `@internal` の `strings` を置く

## 複数 package のリソース

共通文言（例: `foundation_resources`）も使う場合は、複数 Mixin を適用する。

```dart
import 'package:foundation_resources/gen/strings.dart' as foundation_resources;
import 'package:meta/meta.dart';
import 'package:screen_todo_list/gen/strings.dart';

class _Strings with L10nStringsMixin, foundation_resources.L10nStringsMixin {}

@internal
final strings = _Strings();
```

明示 export していなくても、生成 `strings.dart` の import は認める。

## アプリへの接続

`L10nHelper` の生成コードは `package:material_ui/material_ui.dart` を import する。
出力先 package（例: `app`）に `material_ui` 依存を置く。

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

## 依存の置き方

* `monolith` / `monolith_localization` 等の生成系は、だいたい workspace **ルート**の dev 依存で足りる
* 生成コードが参照するのは主に `monolith_localization_runtime`（文言を使う各 package に依存を置く）
* `L10nHelper` 出力先には `material_ui` が必要

## StringsTestHelper

`localization.test_helper` を **既存の必須設定に追記**すると、ARB を Base64 埋め込みしたヘルパーが生成される。
`languages` / `app` / `package` なしの断片だけでは動かない。

出力例: `packages/foundation/resources/lib/gen/strings_test_helper.dart`

```dart
import 'package:foundation_resources/gen/strings_test_helper.dart';
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

Future<void> injectTodoTestLocalization() {
  return LocalizeStringDelegate.injectDelegateForTest(
    arbJson: StringsTestHelper.ja,
  );
}
```

* getter 名は言語コードを識別子化した結果（`ja` → `ja`、`zh-Hans` → `zh_Hans`）。衝突時は生成が失敗する
* リリースビルドから `StringsTestHelper` を呼ばない（`UnsupportedError`）
* テスト／Preview 側は生成先 package と `monolith_localization_runtime` に依存する

## DO / DO NOT

### DO: 文言変更は strings*.csv のみ

* CSV を単一の真実源とし、生成物を手編集しない
* 変更後は `dart run monolith_runner:localization`

### DO: Test / Preview では StringsTestHelper で注入

* `LocalizeStringDelegate.injectDelegateForTest(arbJson: StringsTestHelper.ja)`
* ARB ファイルの直読みを避ける（ヘルパーがある場合）

### DO: strings.dart は各 package で作成し export しない

* `@internal` な `strings` + 必要なら複数 Mixin

### DO NOT: gen/strings.dart / strings_test_helper.dart を手編集

* 再生成で上書きされ、不整合の原因になる

### DO NOT: リリースコードから StringsTestHelper を使う

* 本番は `L10nStringsMixin` 経由の `strings` を使う

### DO NOT: L10nHelper を gen-l10n の成果物と混同する

* gen-l10n は `L10n` 等、`L10nHelper` は monolith 側ジェネレータが出力する

## 参考

* Flutter internationalization: <https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization>
