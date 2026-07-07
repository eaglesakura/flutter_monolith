# Flutter Monolith

![Flutter Monolith](./docs/res/monolith_logo.png)

Flutterプロジェクトのモジュラーモノリス構造をサポートする統合プロジェクト管理ツールセットである。
大規模なFlutterアプリケーション開発において、複数のパッケージを効率的に管理し、
開発環境の構築から本番リリースまでの全プロセスを自動化する。

## 🚀 解決する課題

大規模なFlutterプロジェクトでは以下のような課題が発生する：

**環境管理の複雑化**

- フレーバー別の設定管理が煩雑
- 機密ファイルのバージョン管理問題
- 開発者間での環境構築の不整合

**ローカライズの限界**

- Flutter標準の国際化機能はアプリケーションレベルのみ
- パッケージ単位での独立したローカライズが困難
- ドメインロジックと翻訳リソースの分離ができない

**iOS開発の複雑さ**

- Xcodeプロジェクト設定の手動管理
- 証明書・プロビジョニングプロファイルの配布
- チーム間での設定共有の困難

**プロジェクト管理の非効率**

- 各ツールを個別実行する手間
- CI/CD環境での設定の複雑化
- 開発ワークフローの標準化不足

## ✨ 主要機能

### 🔧 統合プロジェクト管理

- **monolith.yaml**: 全設定を一元管理
- **統一ランナー**: `dart run monolith_runner:*`コマンドで全機能実行
- **CI/CD最適化**: 自動化された開発環境構築

### 🌍 高度なローカライズ

- **モジュール単位管理**: パッケージごとの独立したローカライズリソース
- **CSV管理**: シンプルな形式での多言語リソース定義
- **型安全アクセス**: 自動生成されるMixinクラスによる実行時保証

### 🔐 セキュアな設定管理

- **シークレット分離**: 機密ファイルをバージョン管理から除外
- **1Password連携**: `op inject`コマンドとの統合
- **自動展開**: Base64ファイルとテキストファイルの安全な配布

### 📱 iOS開発自動化

- **xcodegen統合**: YAMLベースのXcodeプロジェクト生成
- **環境変数注入**: シークレット管理ツールとの連携
- **ファイル作成**: ビルドに必要なファイルの事前作成

## 🚀 クイックスタート

### インストール

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

### 基本設定

プロジェクトルートに`monolith.yaml`を作成：

```yaml
# monolith.yaml
includes:
  - secrets/monolith.yaml

define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
    production:
      FLAVOR: production
      API_URL: https://api.example.com

localization:
  languages:
    - ja
    - en
  app:
    package_name: app
    arb_path: lib/l10n/
  package:
    path_prefixes:
      - packages/
    resources_path: res/

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist

install:
  - path: secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: app/ios/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

### 基本的な使用方法

```bash
# シークレットデータの注入
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# 開発環境のセットアップ
dart run monolith_runner:install        # シークレットファイルの展開
dart run monolith_runner:define         # 環境定数の生成
dart run monolith_runner:localization   # ローカライズリソースの生成
dart run monolith_runner:xcodegen       # Xcodeプロジェクトの生成

# アプリケーションのビルド
flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 📦 パッケージ構成

### Core Packages

| パッケージ | 説明 | 用途 |
|-----------|------|------|
| **monolith** | メインライブラリ | プロジェクト管理・タスク実行の統制 |
| **monolith_runner** | 統一ランナー | `dart run monolith_runner:*`コマンドの提供 |

### Feature Packages

| パッケージ | 説明 | 主要機能 |
|-----------|------|----------|
| **monolith_define** | Dart Define管理 | フレーバー別環境定数・JSONファイル生成 |
| **monolith_install** | シークレットファイル展開 | 機密ファイルの安全な配布・展開 |
| **monolith_localization** | モジュール単位ローカライズ | パッケージ独立型多言語リソース管理 |
| **monolith_localization_runtime** | ローカライズランタイム | 生成コードの実行時サポート |
| **monolith_xcodegen** | Xcodeプロジェクト生成 | xcodegenツールを使用したXcodeプロジェクトの自動生成 |

## 🏗️ プロジェクト構造例

```
my_flutter_app/
├── monolith.yaml                    # 統合設定ファイル
├── secrets/
│   ├── monolith.yaml               # シークレット注入後の設定
│   └── dart-define/                # 生成された環境定数
│       ├── development.json
│       └── production.json
├── app/                            # メインアプリケーション
│   ├── lib/
│   │   ├── l10n/                   # アプリケーション用ローカライズ
│   │   └── gen/
│   │       └── defines.dart        # 生成された環境定数クラス
│   └── ios/
│       └── Runner.xcodeproj        # 生成されたXcodeプロジェクト
└── packages/                       # ドメイン・機能別パッケージ
    ├── domain/
    │   └── user/
    │       ├── res/
    │       │   └── strings.csv     # パッケージ独自のローカライズ
    │       └── lib/
    │           └── gen/
    │               └── strings.dart # 生成されたローカライズクラス
    └── screen/
        └── login/
            ├── res/
            │   └── strings.csv
            └── lib/
                └── gen/
                    └── strings.dart
```

## 🔄 開発ワークフロー

### 1. 初期セットアップ

```bash
# 依存関係のインストール
dart pub get

# 開発環境の構築
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen
```

### 2. 日常開発

```bash
# ローカライズリソースの更新
dart run monolith_runner:localization

# 新しい環境定数の追加
dart run monolith_runner:define

# iOS設定の更新
dart run monolith_runner:xcodegen
```

### 3. CI/CD統合

```yaml
# .github/workflows/build.yml
- name: Setup development environment
  env:
    OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
  run: |
    op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
    dart run monolith_runner:install
    dart run monolith_runner:define
    dart run monolith_runner:xcodegen

- name: Build iOS
  run: flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 🤝 対象プロジェクト

このツールセットは以下のようなFlutterプロジェクトに最適である：

- **大規模なモジュラーモノリス構造**を採用するプロジェクト
- **複数の開発者・チーム**が協業するプロジェクト
- **マルチフレーバー**（開発・本番環境など）を持つプロジェクト
- **多言語対応**が必要なプロジェクト
- **iOS/Android両対応**のモバイルアプリケーション
- **CI/CD**による自動化を重視するプロジェクト

## 📄 ライセンス

MIT License - 詳細は[LICENSE](LICENSE)ファイルを参照

## 🤝 コントリビューション

Issue報告やプルリクエストを歓迎する。大規模な変更を行う前に、
まずIssueで議論することを推奨する。

---

**Flutter Monolith**を使用することで、大規模Flutterプロジェクトの複雑性を管理し、
開発効率を大幅に向上させることができる。モジュラーモノリス構造の利点を最大限活用し、
スケーラブルで保守性の高いFlutterアプリケーションを構築しよう。
