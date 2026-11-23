---
name: pub-flutter-monolith-define
description: >-
  monolith_define による Flavor / --dart-define-from-file / Defines クラス生成の利用ガイド。
  環境定数の追加・変更、development／production／test フレーバー、Defines.override、
  「dart-define を生成して」「Defines.FLAVOR を読んで」では必ず使う。
  L10n・シークレット展開・xcodegen 本体は他の pub-flutter-monolith-* を使う。
---
# monolith_define / 環境定数

`monolith.yaml` の `define` から、フレーバー別 JSON（`--dart-define-from-file` 用）と
型安全な `Defines` アクセサを生成する。

## 使わないか

* ローカライズ文言（→ `pub-flutter-monolith-localization`）
* Keystore 等のファイル配布（→ `pub-flutter-monolith-install`）

## 設定フィールド

| キー | 必須 | 備考 |
| --- | --- | --- |
| `output_path` | 必須 | フレーバー JSON の出力先ディレクトリ |
| `generate` | 必須 | 生成 Dart の指定 |
| `generate.package_name` | 必須 | 出力先 package 名 |
| `generate.helper_path` | 必須 | package 内の相対パス（例: `lib/gen/defines.dart`） |
| `generate.test_flavor` | 任意 | 既定 `test`。**同名キーを `flavors` に置くこと** |
| `flavors` | 必須 | `{flavor名: {KEY: 文字列値}}`。値はすべて文字列 |

真偽や数値も YAML では文字列にする（例: `DEBUG_MODE: "true"`）。生の `true` / `1` はパースで落ちる。

## 設定（Example: TODO アプリ）

```yaml
define:
  output_path: .secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    test_flavor: test          # optional, default: test → flavors.test が必要
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

## 生成とビルド

```bash
dart run monolith_runner:define
```

生成例:

* `.secrets/dart-define/development.json`（`flavors` の各キーごと）
* `packages/foundation/metadata/lib/gen/defines.dart`（`package_name` / `helper_path` に依存）

```bash
flutter build apk --dart-define-from-file=.secrets/dart-define/production.json
```

## プログラムからの参照

```dart
import 'package:foundation_metadata/gen/defines.dart';

void configureApiClient() {
  final baseUrl = Defines.API_URL;
  final isProd = Defines.FLAVOR == 'production';
  // ...
}
```

生成ファイルは手編集しない。キー追加・値変更は `monolith.yaml` を直して再生成する。

## テスト時のロードと上書き

* `flutter test` は `{output_path}/{test_flavor}.json` をワークスペースから探す
* そのため **`test_flavor` と同名の `flavors` エントリが必須**（既定なら `flavors.test`）
* 無いと探索が終わらずハングしうる

Integration Test など `--dart-define` を自由に渡せないときは `Defines.override` を使う。
部分上書きなら、先にいずれかの getter で base（test flavor）をロードしてから `override` する
（先に `override` だけ呼ぶと test JSON のロードがスキップされる）。

```dart
import 'package:foundation_metadata/gen/defines.dart';

void main() {
  // ignore: unused_local_variable
  final _ = Defines.FLAVOR; // base の test flavor をロード
  Defines.override({
    'API_URL': 'https://api-test.example.com',
  });
  // ...
}
```

詳細は [references/defines-usage.md](./references/defines-usage.md) を読む。
