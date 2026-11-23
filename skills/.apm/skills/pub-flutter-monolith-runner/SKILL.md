---
name: pub-flutter-monolith-runner
description: >-
  monolith_runner の統一 CLI（dart run monolith_runner:install / define /
  localization / xcodegen）の利用ガイド。開発環境セットアップ、CI での
  monolith タスク実行、「monolith_runner で生成して」では必ず使う。
  monolith.yaml の各セクション詳細は pub-flutter-monolith-define 等へ委譲する。
  Flutter 標準ビルドのみ、gen-l10n のみでは使わない。
---
# monolith_runner / 統一 CLI

`dev_dependencies` に `monolith_runner` を足すと、ルートから各 monolith 機能を同じ形で実行できる。
設定の正本はプロジェクトルートの `monolith.yaml` である。

## 使わないか

* `monolith.yaml` の各キーの意味そのもの（→ 対応する `pub-flutter-monolith-*`）
* Flutter / Dart の通常ビルド・テストだけ

## 導入

```yaml
# pubspec.yaml（dart workspace ルート）
dev_dependencies:
  monolith_runner: ^1.0.0
```

個別 package に runner を足す必要はない。

## コマンド一覧

```bash
dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen
```

| コマンド | やること |
| --- | --- |
| `:install` | シークレット等のファイル展開 |
| `:define` | dart-define JSON と `Defines` 生成 |
| `:localization` | CSV → ARB / Mixin /（任意）StringsTestHelper |
| `:xcodegen` | touch + xcodegen 実行 |

## セットアップ順（Example: TODO アプリ）

シークレットがある場合は先に注入する。

```bash
mkdir -p .secrets
op inject --force --in-file monolith.yaml --out-file .secrets/monolith.secrets.yaml

dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen
```

日常開発では変更した機能だけ再実行すればよい（文言だけなら `:localization` など）。

## CI での利用

```yaml
# .github/workflows/build.yml（抜粋）
- name: Setup monolith
  env:
    OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
  run: |
    mkdir -p .secrets
    op inject --force --in-file monolith.yaml --out-file .secrets/monolith.secrets.yaml
    dart run monolith_runner:install
    dart run monolith_runner:define
    dart run monolith_runner:xcodegen

- name: Build
  run: flutter build apk --dart-define-from-file=.secrets/dart-define/production.json
```

失敗時はプロセスが非ゼロで終了する想定でパイプラインを組む。詳細な YAML 骨格は `pub-flutter-monolith` の references を読む。
