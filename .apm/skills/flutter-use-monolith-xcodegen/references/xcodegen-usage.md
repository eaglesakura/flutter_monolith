# xcodegen 連携（Example: TODO アプリ）

## ディレクトリ

```text
todo_app/
└── app/
    └── ios/
        ├── project.yml          # xcodegen 入力（手管理）
        ├── GoogleService-Info.plist   # touch / install で用意
        └── Runner.xcodeproj     # 生成物（多くの場合 ignore）
```

`package_name: app` のとき、実行ディレクトリは `app/ios/` になる。

## 設定フィールド

* `package_name`（必須）
* `touch_files`（任意、省略時は何もしない）
* `env`（任意、省略時は空マップ）

ランナーは xcodegen 前に対象 package の `pub get` 相当を実行する。

## touch_files の役割

ビルドや xcodegen が「ファイルが存在する」ことを前提にする場合に、**存在しないときだけ**空ファイルを作る（既存は壊さない）。
`createSync()` は親ディレクトリを作らないため、中間パスは先に用意する。
中身が必要な plist は、先に `pub-flutter-monolith-install` で実ファイルを展開する。

## env の役割

xcodegen 実行プロセスの環境変数として渡す。`project.yml` 側で `${DEVELOPMENT_TEAM}` 等を参照する構成と組み合わせる。

## DO / DO NOT

### DO

* `project.yml` を正本としてコミットする
* CI でも同じ `dart run monolith_runner:xcodegen` を使う
* 実 Team ID は inject 後 YAML または CI 秘密情報経由にする
* `touch_files` の親ディレクトリを先に用意する

### DO NOT

* 生成された `*.xcodeproj` を手でメンテし続ける（再生成前提なら）
* SKILL 例に実 Team ID・実プロファイル UUID を書く
