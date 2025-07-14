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
