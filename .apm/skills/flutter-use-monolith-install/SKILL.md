---
name: flutter-use-monolith-install
description: >-
  monolith_install によるシークレット／設定ファイル展開の利用ガイド。
  Keystore、GoogleService-Info、android.properties、op inject 連携、
  「secrets を展開して」「install タスクを書いて」では必ず使う。
  dart-define 生成や L10n・xcodegen 本体は他の flutter-use-monolith-* を使う。
---
# monolith_install / ファイル展開

`op inject` などで得た実値を、ワークスペース上のパスへファイルとして展開する。
バイナリは Base64、設定はテキストとして定義できる。

## 使わないか

* 環境定数 JSON / `Defines`（→ `flutter-use-monolith-define`）
* 文言リソース（→ `flutter-use-monolith-localization`）

## 前提フロー

```bash
mkdir -p .secrets
op inject --force --in-file monolith.yaml --out-file .secrets/monolith.secrets.yaml
dart run monolith_runner:install
```
`includes` で注入後 YAML を取り込む構成が多い。詳細は `flutter-use-monolith` を参照する。

## 設定（Example: TODO アプリ）

```yaml
install:
  - path: .secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64

  - path: .secrets/android.properties
    text_file: |
      android.projectName = TodoApp
      android.applicationId = com.example.todo_app
      android.keystore.password = op://vault-id/android-keystore/password

  - path: app/android/app/src/production/google-services.json
    base64_file: op://vault-id/google-services/android-production.json.base64

  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

| キー | 意味 |
| --- | --- |
| `path` | 展開先（ワークスペース相対）。必須 |
| `base64_file` | Base64 本文（または inject 後の実値） |
| `text_file` | テキスト本文 |
| `properties` | DTO 上は存在するが、**現行ランナーは未使用**（書いても展開に効かない） |

### 展開時の挙動

* `base64_file` と `text_file` が両方あるときは **`base64_file` 優先**
* どちらも無いエントリはスキップする
* 既存ファイルは上書きする（ログに `overwrite`）
* 親ディレクトリは自動作成しない。先にディレクトリを用意する

## セキュリティ

* 展開先は `.gitignore` で除外する
* 実 vault パス・実パスワードを SKILL やコミット済み YAML テンプレートに直書きしない
* CI ではサービスアカウント等で `op` を認証してから inject → install する

詳細例は [references/install-patterns.md](./references/install-patterns.md) を読む。
