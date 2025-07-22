`op inject`コマンドなどでシークレット管理ツールから取得したデータを、ワークスペースに安全にファイル展開するパッケージである。
1PasswordやAWS Secrets Managerなどのシークレット管理ツールと連携し、機密ファイルの配布を自動化する。

## Features

* **Base64ファイル展開**: エンコードされたバイナリファイルをデコードして配置
* **テキストファイル生成**: 設定ファイルやプロパティファイルの動的生成
* **シークレット管理ツール連携**: 1Password CLI、AWS CLI等との自動連携
* **セキュアな配布**: 機密ファイルをバージョン管理に含めない安全な配布方式

## Getting started

`monolith.yaml`の`install`セクションで展開するファイルを定義する。
事前に`op inject`コマンドでシークレットデータを取得し、展開処理を実行する。

```bash
# 1Password CLIでシークレットデータを注入
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# ファイル展開処理を実行
dart run monolith_install
```

## Usage

**Android開発用ファイルの展開例**:
```yaml
# monolith.yaml
install:
  # Android Keystore（Base64エンコード）
  - path: secrets/android.keystore
    base64_file: op://vault-id/item-id/section/field.base64
  
  # Android設定ファイル（テキスト）
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = op://vault-id/item-id/password
  
  # Google Services設定ファイル
  - path: app/android/app/src/production/google-services.json
    base64_file: op://vault-id/google-services/production.json.base64
```

**iOS開発用ファイルの展開例**:
```yaml
install:
  # 環境別GoogleService-Info.plist
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-debug-dev.plist.base64
  
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-release-prod.plist.base64
```

## Additional information

このパッケージは機密ファイルをバージョン管理システムに含めることなく、
開発チーム間で安全に共有するために設計されている。

**サポートする展開形式**:
- `base64_file`: Base64エンコードされたバイナリファイル
- `text_file`: プレーンテキストファイル（環境変数展開対応）

**セキュリティ要件**:
- 展開されたファイルは`.gitignore`で除外すること
- シークレット管理ツールへのアクセス権限を適切に管理すること
- CI/CD環境では適切な認証情報を設定すること

モバイルアプリ開発でよく使用されるKeystoreファイル、証明書、API設定ファイルなどの
機密ファイル配布に最適化されている。

**バージョン互換性**: このパッケージは最新のmonolithエコシステムとの互換性を維持し、全てのプロジェクト管理機能との信頼性のある統合を保証する。
