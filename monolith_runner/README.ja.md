monolithの各機能を統一されたコマンドラインインターフェースから実行するためのランナーパッケージである。
`dev_dependencies`に追加することで、`dart run monolith:*`コマンドからmonolithの全機能にアクセスできるようになる。

## Features

* **統一コマンドライン**: 全てのmonolith機能を一貫したインターフェースで実行
* **開発時統合**: dev_dependenciesでの簡潔な導入
* **自動機能発見**: 利用可能なmonolith機能の自動検出と実行
* **エラーハンドリング**: 適切なエラーメッセージとヘルプ表示

## Getting started

プロジェクトの`pubspec.yaml`の`dev_dependencies`セクションに追加する：

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

## Usage

```yaml
# monolith.yaml - 設定例
# 注意: このファイルはバージョン管理にコミットしてください

# シークレットファイルをインクルード (op inject コマンドで注入)
includes:
  - secrets/monolith.yaml

# Dart Define設定
define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    # オプション, デフォルト: `test`
    test_flavor: test
  # 必須
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
      DEBUG_MODE: true
      LOG_LEVEL: debug
    production:
      FLAVOR: production
      API_URL: https://api.example.com
      DEBUG_MODE: false
      LOG_LEVEL: info
    test:
      FLAVOR: development
      API_URL: https://api-test.example.com
      DEBUG_MODE: true
      LOG_LEVEL: debug

# ローカライズ設定
localization:
  # 必須
  languages:
    - ja
    - en
  app:
    # 必須, モジュール名
    package_name: app
    # オプション, デフォルト: `lib/l10n/`
    arb_path: lib/l10n/
    # オプション, デフォルト: `intl_app_`
    arb_file_prefix: intl_app_
    # オプション, デフォルト: `L10nHelper`
    l10n_helper_class_name: L10nHelper
    # オプション, デフォルト: `lib/l10n/l10n_helper.dart`
    l10n_helper_path: lib/l10n/l10n_helper.dart
  package:
    # 必須, パッケージへのパス (ルートからの相対パス)
    path_prefixes:
      - app/
      - packages/
    # オプション, デフォルト: `res/`
    resources_path: res/
    # オプション, デフォルト: `L10nStringsMixin`
    module_helper_class_name: L10nStringsMixin
    # オプション, デフォルト: `lib/gen/strings.dart`
    module_helper_path: lib/gen/strings.dart

# Xcodeプロジェクト生成設定
xcodegen:
  # 必須
  package_name: app
  # オプション - xcodegen実行前に作成するファイル
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  # オプション - xcodegen実行時の環境変数
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: "iPhone Developer"
    BUNDLE_ID_SUFFIX: dev

# ファイルインストール設定
install:
  # Androidファイル
  - path: secrets/android.keystore
    base64_file: <base64_encoded_keystore_content>
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = <keystore_password>
      android.keystore.debug.password = <debug_password>
      android.keystore.release.password = <release_password>
  - path: app/android/app/src/development/google-services.json
    base64_file: <base64_encoded_google_services_json>
  - path: app/android/app/src/production/google-services.json
    base64_file: <base64_encoded_google_services_json>

  # iOSファイル - Development
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Profile-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Release-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>

  # iOSファイル - Production
  - path: app/ios/Configurations/Debug-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Profile-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
```

**1Password CLIとの連携例**:
```yaml
# 本番環境での1Password CLI使用例
# プレースホルダーを実際の1Password参照に置換してください

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    DEVELOPMENT_TEAM: op://vault-id/apple-developer/team-id
    CODE_SIGN_IDENTITY: op://vault-id/apple-developer/code-sign-identity
    BUNDLE_ID_SUFFIX: op://vault-id/app-config/bundle-suffix

install:
  - path: secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = op://vault-id/android-keystore/keystore-password
      android.keystore.debug.password = op://vault-id/android-keystore/debug-password
      android.keystore.release.password = op://vault-id/android-keystore/release-password
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

**利用可能なコマンド一覧**:
```bash
# シークレットファイルのインストール
dart run monolith:install

# ローカライズリソースの生成
dart run monolith:localization

# Dart Define定数の生成
dart run monolith:define

# Xcodeプロジェクトの生成
dart run monolith:xcodegen
```

**CI/CD統合例**:
```yaml
# .github/workflows/build.yml
name: Build
on: [push, pull_request]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        
      - name: Install dependencies
        run: dart pub get
        
      - name: Setup development environment
        env:
          OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
        run: |
          op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
          dart run monolith:install
          dart run monolith:define
          dart run monolith:xcodegen
          
      - name: Build iOS
        run: flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## Additional information

このランナーパッケージは開発ワークフローを効率化するために設計されている：

**開発者体験の向上**:
- **統一されたコマンド体系**: 覚えやすく一貫したコマンド名
- **段階的実行**: 必要な機能のみを個別実行可能
- **一括実行**: 開発環境セットアップの自動化

**CI/CD環境での利点**:
- **エラーハンドリング**: 失敗時の適切なエラーコードとメッセージ
- **ログ出力**: 進捗と結果の明確な表示

**プロジェクト統合**:
- **軽量導入**: dev_dependenciesのみで全機能利用可能
- **設定ファイル共有**: プロジェクトルートの`monolith.yaml`を共通利用
- **バージョン管理**: monolith機能のバージョン一元管理

monolithライブラリ群を最大限活用するための統一エントリーポイントとして、
開発からリリースまでの全プロセスを効率化する。
