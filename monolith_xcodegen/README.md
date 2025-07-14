`xcodegen`を使用したiOSプロジェクト生成をサポートするパッケージである。
`monolith.yaml`の設定に基づいて、環境変数の注入やファイル作成を自動化し、
Flutterプロジェクトに最適化されたXcodeプロジェクト生成を提供する。

## Features

* **自動プロジェクト生成**: xcodegen YAMLファイルからXcodeプロジェクトを自動生成
* **環境変数注入**: 1Password等のシークレット管理ツールと連携した環境変数設定
* **必要ファイル作成**: ビルドに必要なファイルの事前作成とタッチ処理
* **Flutter最適化**: Flutterプロジェクト構造に適応したプロジェクト設定

## Getting started

`monolith.yaml`の`xcodegen`セクションで設定を記述し、事前に`xcodegen`ツールをインストールする。

```bash
# xcodegenのインストール
brew install xcodegen
```

## Usage

**基本設定例** (`monolith.yaml`):
```yaml
xcodegen:
  # 必須: 対象パッケージ名
  package_name: app
  
  # オプション: 事前作成が必要なファイル
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  
  # オプション: xcodegen実行時の環境変数
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: iPhone Developer
```

**シークレット管理との連携例**:
```yaml
xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    # 1Password CLIからの環境変数注入
    DEVELOPMENT_TEAM: op://vault-id/apple-dev/team-id
    PROVISIONING_PROFILE_UUID: op://vault-id/provisioning/profile-uuid
    BUNDLE_ID_SUFFIX: op://vault-id/app-config/bundle-suffix
```

**実行例とログ出力**:
```bash
$ dart run monolith_xcodegen

Generating Xcode project with xcodegen...
✓ Reading monolith.yaml configuration
✓ Setting environment variables:
  - DEVELOPMENT_TEAM: ABC***456
  - PROVISIONING_PROFILE_UUID: 12345***890
✓ Creating touch files:
  - ios/GoogleService-Info.plist
  - ios/firebase_app_id_file.json
✓ Running xcodegen...
✓ Xcode project generated successfully

Project generated at: app/ios/Runner.xcodeproj
```

**生成されるXcodeプロジェクトの特徴**:
- Flutterフレームワークとの適切な連携設定
- 環境別の設定ファイルの自動認識
- コード署名設定の自動適用
- ビルドスクリプトの最適化

## Additional information

このパッケージは以下のワークフローをサポートする:

**開発チーム向けの利点**:
- **環境の標準化**: 全開発者が同一のXcodeプロジェクト設定を共有
- **シークレット管理**: 機密情報をバージョン管理から分離
- **自動化**: CI/CD環境での自動プロジェクト生成

**サポートする環境変数の例**:
- `DEVELOPMENT_TEAM`: Apple Developer Team ID
- `CODE_SIGN_IDENTITY`: コード署名アイデンティティ
- `PROVISIONING_PROFILE_UUID`: プロビジョニングプロファイルUUID
- `BUNDLE_ID_SUFFIX`: Bundle Identifierサフィックス

**前提条件**:
- `xcodegen`ツールがシステムにインストールされていること
- 対象パッケージに`project.yml`ファイルが存在すること
- 必要に応じてシークレット管理ツール（1Password CLI等）が設定済みであること

**トラブルシューティング**:
- ファイルが見つからない場合: `touch_files`設定で事前作成を確認
- 環境変数が反映されない場合: シークレット管理ツールの認証状態を確認
- プロジェクト生成に失敗する場合: `project.yml`の構文エラーをチェック

Flutterとネイティブプラットフォーム開発を橋渡しし、
iOS開発における複雑な設定管理を自動化することで、開発効率を大幅に向上させる。
