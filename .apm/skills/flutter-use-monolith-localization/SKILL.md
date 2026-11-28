---
name: flutter-use-monolith-localization
description: >-
  monolith_localization による Flutter 文字列外部リソース化・L10n
  （res/strings.csv → dart run monolith_runner:localization → L10nStringsMixin /
  StringsTestHelper）の利用ガイド。文言追加・変更、CSV ヘッダー、生成コマンド、
  lib/src/strings.dart、複数 package の mixin、Unit／Widget Preview／Golden での
  injectDelegateForTest では必ず使う。「strings.csv に足して」「L10n 生成して」
  「StringsTestHelper」でもロードする。Flutter 標準 gen-l10n だけ・ARB 手編集だけ、
  Dart コーディング規約のみでは使わない。詳細は references/localization.md。
  旧名 flutter-monolith-localization からの移行先。
---
# monolith_localization / L10n

`monolith` 経由のローカライゼーション（CSV → 生成コード）を扱うときはこの SKILL に従う。
実装の細部・DO/DO NOT は [references/localization.md](./references/localization.md) を読む。

コマンド例はツール本体だけを書く。ツールチェイン wrapper はリポジトリ規約に任せる。

## 使わないか

* Flutter 標準 `gen-l10n` / ARB 手編集のみ（monolith を使わない場合）
* 実行時の `LocalizeStringDelegate` API 詳細のみ（→ `flutter-use-monolith-localization-runtime`）
* Dart の一般コーディング規約のみ

## データレイアウト（Example: TODO アプリ）

各 package ごと（必要に応じて）:

```text
packages/screen/todo_list/
├── lib/
│   ├── gen/
│   │   └── strings.dart          # 自動生成（手編集しない）
│   └── src/
│       └── strings.dart          # 手書き: L10nStringsMixin を mixin
├── pubspec.yaml
└── res/                          # package.resources_path（既定）
    └── strings.csv               # 真実源（strings*.csv を再帰探索）
```

集約先は **`localization.app.package_name`**（例: `app`）である。

* ARB → `app.arb_path`（既定 `lib/l10n/`）
* Flutter gen-l10n → `L10n` 等（出力先 package の `flutter: generate: true`）
* monolith の `L10nHelperGenerator` → `app.l10n_helper_path`（既定 `lib/l10n/l10n_helper.dart`）

アプリは生成された `L10nHelper` を `MaterialApp` 等へ渡す。`L10nHelper` 生成コードは `material_ui` を import するため、出力先 package に `material_ui` 依存が必要である。

## 作業手順

1. `resources_path` 配下の `strings*.csv` を編集する（ヘッダー `id,{言語コード},description`）
2. ルートから生成する: `dart run monolith_runner:localization`
3. パッケージの `lib/src/strings.dart` で生成 mixin を使う（`export` しない、`@internal`）
4. テスト／Preview が必要なら `StringsTestHelper` + `LocalizeStringDelegate.injectDelegateForTest`

## 依存ライブラリ

| パッケージ | 置き場所 |
| --- | --- |
| monolith / monolith_localization | dart workspace **ルート**の `dev_dependencies`（runner 経由で足りる構成が多い） |
| monolith_localization_runtime | **文言を参照する個別 package** の `dependencies` |
| material_ui | **`L10nHelper` 出力先**（`localization.app.package_name`）の `dependencies` |

個別 package に monolith / monolith_localization を足す必要はない。

## StringsTestHelper（Test / Preview / Golden）

`localization.test_helper` は省略可。省略時はヘルパーを生成しない。
次は **既存の `languages` / `app` / `package` に追記する**例である（`app` / `package` は必須）。

```yaml
localization:
  languages:
    - ja
    - en
  app:
    package_name: app
  package:
    path_prefixes:
      - app/
      - packages/
  test_helper:
    package_name: foundation_resources
    test_helper_class_name: StringsTestHelper
    test_helper_path: lib/gen/strings_test_helper.dart
```

生成後は言語ごとの getter（例: `StringsTestHelper.ja`）を `injectDelegateForTest` に渡す。
言語コードは識別子へ正規化される（例: `zh-Hans` → `zh_Hans`）。
リリースモードでは getter が `UnsupportedError` を投げる。詳細は references を読む。

## 主な遵守事項

* [ ] リソース定義は `resources_path` 配下の `strings*.csv`。ヘッダー `id,{言語コード},description`
* [ ] CSV 変更後は `dart run monolith_runner:localization` で再生成
* [ ] アクセスは `lib/src/strings.dart` + 生成 `L10nStringsMixin`（`export` しない、`@internal`）
* [ ] 他 package の文言が必要なら、該当 `L10nStringsMixin` を必要な数だけ mixin
* [ ] Test / Preview / Golden では `StringsTestHelper` + `injectDelegateForTest`
* [ ] `StringsTestHelper` をリリースビルドから呼ばない
* [ ] `lib/gen/strings.dart` / `strings_test_helper.dart` を手編集しない
