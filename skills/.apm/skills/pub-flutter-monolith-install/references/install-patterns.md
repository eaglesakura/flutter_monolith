# install パターン（Example: TODO アプリ）

## Android

```yaml
install:
  - path: .secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: .secrets/android.properties
    text_file: |
      android.projectName = TodoApp
      android.applicationId = com.example.todo_app
      android.keystore.password = op://vault-id/android-keystore/password
      android.keystore.debug.password = op://vault-id/android-keystore/debug-password
      android.keystore.release.password = op://vault-id/android-keystore/release-password
```

## iOS（フレーバー別 plist）

```yaml
install:
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-debug-dev.plist.base64
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-release-prod.plist.base64
```

xcodegen 前にファイルが必要な場合は、`xcodegen.touch_files` と組み合わせる
（→ `pub-flutter-monolith-xcodegen`）。

## ランナー挙動の補足

* 有効な展開キーは実質 `base64_file` / `text_file` のみ（両方あると base64 優先）
* YAML に `properties` を書いても現行実装では無視される。展開用途に使わない
* 展開先の親ディレクトリは事前に存在させる

## DO / DO NOT

### DO

* テンプレートの参照は `op://vault-id/...` のようなプレースホルダに留める
* 展開後パスを ignore する
* CI では inject → `dart run monolith_runner:install` の順にする

### DO NOT

* 実シークレットをリポジトリにコミットする
* install で dart-define JSON を手書きする（define タスクの担当）
* `properties` キーでファイル展開できると想定する
