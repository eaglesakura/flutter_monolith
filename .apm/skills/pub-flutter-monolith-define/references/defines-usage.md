# Defines 利用の詳細（Example: TODO アプリ）

## 生成 JSON の形

`.secrets/dart-define/development.json`:

```json
{
  "FLAVOR": "development",
  "API_URL": "https://api-dev.example.com"
}
```

* 出力は `{output_path}/{flavor名}.json`（`flavors` のキーごと）
* キー名は YAML のキーがそのまま Dart / JSON に出る。命名は大文字スネークケースが読みやすい
* YAML 上の値は **すべて文字列**（`"true"` / `"false"` をクォートする）

## test_flavor と flavors の対応

* `generate.test_flavor`（既定 `test`）は、テスト時に読む JSON 名を決める
* ランナーは `flavors` に存在するキーだけ JSON を書く
* したがって `flavors` に `test_flavor` と同名エントリが無いと、テスト時にファイルが見つからない

## Defines クラスのイメージ

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND
final class Defines {
  const Defines._();

  static String get FLAVOR { /* ... */ }

  static String get API_URL { /* ... */ }

  @visibleForTesting
  static void override(Map<String, String> defines) { /* ... */ }
}
```

* 通常実行: `String.fromEnvironment`（ビルド時注入）を参照する
* `flutter test`: `{output_path}/{test_flavor}.json` をワークスペースから探す
* `override`: マップで既存キーを上書きし、未登録キーを追加する
* `override` を最初に呼ぶと `_defineList` が非空になり、test JSON の自動ロードがスキップされる。部分上書きなら getter アクセス後に呼ぶ

## 出力先パッケージ

`generate.package_name` は、生成 Dart を置く package 名である（例: `foundation_metadata`）。
その package の `helper_path` にファイルが書かれる。

アプリや他 package から参照するには、通常どおりその package への依存が必要である。

## DO / DO NOT

### DO

* 定数の正本は `monolith.yaml` の `define.flavors`
* `test_flavor` と同名の `flavors` エントリを置く
* 変更後は `dart run monolith_runner:define`
* ビルドは `--dart-define-from-file=` でフレーバー JSON を渡す

### DO NOT

* `lib/gen/defines.dart` を手編集する（再生成で消える）
* flavor 値に YAML の真偽・数値を生で書く
* 本番コードからテスト専用の仮値をハードコードし続ける（`override` はテスト用途）
