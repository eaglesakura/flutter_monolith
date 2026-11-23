---
name: pub-flutter-monolith-xcodegen
description: >-
  monolith_xcodegen による xcodegen 実行・touch_files・環境変数注入の利用ガイド。
  iOS の project.yml から Xcode プロジェクトを再生成する、GoogleService-Info を
  事前作成する、「dart run monolith_runner:xcodegen」では必ず使う。
  project.yml 自体の Flavor 設計の詳細は flutter-xcodegen-ios 等と併用し、
  シークレット展開は pub-flutter-monolith-install を使う。
---
# monolith_xcodegen / iOS プロジェクト生成

`monolith.yaml` の `xcodegen` 設定に従い、対象 package の `ios/` で xcodegen を実行する。
必要ファイルの touch と、実行時環境変数の受け渡しも担う。

## 使わないか

* `project.yml` の Flavor / Signing 設計そのもの（専用の xcodegen SKILL があればそちら）
* Keystore 等の中身の展開（→ `pub-flutter-monolith-install`）

## 前提

* ホストに `xcodegen` が入っていること（例: `brew install xcodegen`）
* 対象 package に `project.yml` があること

## 設定（Example: TODO アプリ）

| キー | 必須 | 備考 |
| --- | --- | --- |
| `package_name` | 必須 | xcodegen を走らせる Flutter package |
| `touch_files` | 任意 | 省略時は空。無いファイルだけ作成（既存は非破壊） |
| `env` | 任意 | 省略時は空。xcodegen プロセスへ渡す環境変数 |

実行前に対象 package で `pub get` 相当が走る。

```yaml
xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: iPhone Developer
    BUNDLE_ID_SUFFIX: .dev
```

シークレット管理と連携する場合:

```yaml
xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    DEVELOPMENT_TEAM: op://vault-id/apple-dev/team-id
    PROVISIONING_PROFILE_UUID: op://vault-id/provisioning/profile-uuid
```

`op inject` 後の YAML を `includes` している前提で、実値が env に渡る。

## 実行

```bash
dart run monolith_runner:xcodegen
```

作業ディレクトリは `{package_name}/ios`（例: `app/ios`）。

ログのイメージ（実装に近い形。パス表記は環境で絶対パスになりうる）:

```text
xcodegen
  - package: app
  - touchFiles: ios/GoogleService-Info.plist
  - env: DEVELOPMENT_TEAM
touch: .../app/ios/GoogleService-Info.plist
exec: xcodegen []
```

## トラブルシュート

| 症状 | 確認 |
| --- | --- |
| ファイル不足で失敗 | `touch_files` と install タスクの出力パス。親ディレクトリが存在するか |
| 環境変数が効かない | inject 済みか、`env` キー名が project.yml と一致するか |
| 生成失敗 | `project.yml` の構文、xcodegen 単体実行でのエラー |

詳細は [references/xcodegen-usage.md](./references/xcodegen-usage.md) を読む。
