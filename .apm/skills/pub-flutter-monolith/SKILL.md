---
name: pub-flutter-monolith
description: >-
  flutter_monolith 全体（monolith.yaml・ワークフロー・パッケージ役割）の利用ガイド。
  monolith 導入、フレーバー／シークレット／L10n／xcodegen のどの機能を使うか迷うとき、
  「monolith.yaml を書いて」「開発環境セットアップを自動化して」では必ず使う。
  個別の define / localization / install / xcodegen / runner の細部は対応する
  pub-flutter-monolith-* に委譲する。Flutter 標準 gen-l10n のみ、一般的な Dart 規約のみ、
  アプリ UI 実装のみでは使わない。
---
# flutter_monolith / 全体ガイド

Flutter のモジュラーモノリス向けに、環境定数・ローカライズ・シークレット展開・iOS プロジェクト生成を
`monolith.yaml` 一枚で統括する。本 SKILL は全体像と設定の骨格を示す。機能別の手順は兄弟 SKILL を読む。

コマンド例はツール本体だけを書く。プロジェクト固有のツールチェイン wrapper はリポジトリ規約に従う。

## 使わないか

* Flutter 標準の `gen-l10n` / ARB 手編集だけ（monolith を使わない）
* Dart / Flutter の一般コーディング規約のみ
* 画面 UI・ビジネスロジックの実装そのもの

## パッケージ役割

| パッケージ | 役割 | 詳細 SKILL |
| --- | --- | --- |
| monolith | 設定モデル・タスク統制 | 本 SKILL |
| monolith_runner | `dart run monolith_runner:*` 入口 | `pub-flutter-monolith-runner` |
| monolith_define | Flavor / dart-define / `Defines` | `pub-flutter-monolith-define` |
| monolith_install | シークレットファイル展開 | `pub-flutter-monolith-install` |
| monolith_localization | CSV → ARB / Mixin 生成 | `pub-flutter-monolith-localization` |
| monolith_localization_runtime | 実行時・テスト注入 | `pub-flutter-monolith-localization-runtime` |
| monolith_xcodegen | xcodegen 実行補助 | `pub-flutter-monolith-xcodegen` |

## 導入の最小手順

1. ルート `pubspec.yaml` の `dev_dependencies` に `monolith_runner` を追加する
2. プロジェクトルートに `monolith.yaml` を置く（骨格は [references/monolith-yaml.md](./references/monolith-yaml.md)）
3. 必要ならシークレット注入後、`dart run monolith_runner:install` / `define` / `localization` / `xcodegen` を実行する
4. ビルド時は `--dart-define-from-file=` で生成 JSON を渡す

## Example: TODO アプリ

例示はすべて次の Example TODO アプリを前提にする。実プロダクト名・実シークレットは使わない。

```text
todo_app/
├── monolith.yaml                 # コミットするテンプレート
├── .secrets/
│   ├── monolith.secrets.yaml     # op inject 後（gitignore）
│   └── dart-define/              # define タスクの出力
│       ├── development.json
│       ├── production.json
│       └── test.json
├── app/
│   ├── lib/l10n/
│   └── ios/
└── packages/
    ├── foundation/
    │   ├── metadata/             # Defines 生成先
    │   └── resources/            # StringsTestHelper / 共通文言
    ├── domain/
    │   └── todo/
    └── screen/
        └── todo_list/
```

## 日常ワークフロー

```bash
# シークレットがある場合（例: 1Password CLI）
mkdir -p .secrets
op inject --force --in-file monolith.yaml --out-file .secrets/monolith.secrets.yaml

dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen

flutter build apk --dart-define-from-file=.secrets/dart-define/production.json
```

詳細な YAML 例・ディレクトリ対応は [references/monolith-yaml.md](./references/monolith-yaml.md) を読む。
機能単位の作業に入ったら、上表の兄弟 SKILL へ切り替える。
