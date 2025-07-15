
Dart `--dart-define`コマンドに渡すためのJSONファイルと、プログラムから型安全にアクセスできる`Defines`クラスを自動生成するパッケージである。
フレーバー別の環境定数管理とビルド時の定数注入を効率化する。

## Features

* **フレーバー別定数管理**: 開発・本番・テスト環境ごとの定数定義
* **JSONファイル自動生成**: `--dart-define-from-file`で利用可能なJSONファイルの出力
* **型安全なアクセス**: 生成される`Defines`クラスによる実行時の定数アクセス
* **ビルドツール連携**: Flutter/Dartビルドプロセスとの自動連携

## Getting started

`monolith.yaml`の`define`セクションで設定を記述する。

```yaml
# monolith.yaml
define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    # optional, default: `test`
    test_flavor: test
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
    production:
      FLAVOR: production
      API_URL: https://api.example.com
    test:
      FLAVOR: development
      API_URL: https://api-test.example.com
```

## Usage

上記設定により以下のファイルが生成される:

**JSONファイル例** (`secrets/dart-define/development.json`):
```json
{
  "FLAVOR": "development",
  "API_URL": "https://api-dev.example.com"
}
```

**生成される Defines クラス例**:
```dart
final class Defines {
  static String get FLAVOR { ... }
  
  static String get API_URL { ... }
}
```

**ビルド時の利用方法**:

```bash
# JSONファイルを使用したビルド
flutter build apk --dart-define-from-file=secrets/dart-define/production.json
```

# プログラムからのアクセス

```dart
import 'package:foundation_metadata/gen/defines.dart';

void main() {
  print('Current flavor: ${Defines.FLAVOR}');
  print('API URL: ${Defines.API_URL}');
  
  if (Defines.FLAVOR == 'production') {
    // 本番環境の処理
  }
}
```

## Additional information

このパッケージはFlutterアプリケーションのマルチフレーバー開発に最適化されている。
環境固有の設定値を型安全に管理し、ビルド時の定数注入を自動化することで、
開発効率の向上とリリース時のヒューマンエラーを防止する。

**テスト環境での特別機能**:
- `flutter test`実行時は自動的にワークスペースディレクトリを検索
- テストフレーバー用のJSONファイルから定数を動的に読み込み
- ビルド時定数とテスト時定数を透過的に切り替え

これにより、単体テストやインテグレーションテストでも
一貫した環境定数の利用が可能である。
