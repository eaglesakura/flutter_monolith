# flutter-monolith skills

[flutter_monolith](https://github.com/eaglesakura/flutter_monolith) ライブラリ群の利用方法をまとめた APM SKILL パッケージである。

## Quick Start

```yaml
dependencies:
  apm:
    - eaglesakura/flutter_monolith/skills#main
```

## SKILLS

※ `.apm/skills/` 配下。

| SKILL | 対象 |
| --- | --- |
| `pub-flutter-monolith` | 全体像・`monolith.yaml`・ワークフロー |
| `pub-flutter-monolith-runner` | `dart run monolith_runner:*` |
| `pub-flutter-monolith-define` | Flavor / dart-define / `Defines` |
| `pub-flutter-monolith-install` | シークレットファイル展開 |
| `pub-flutter-monolith-localization` | CSV → ARB / Mixin / StringsTestHelper |
| `pub-flutter-monolith-localization-runtime` | 実行時・テスト注入 API |
| `pub-flutter-monolith-xcodegen` | xcodegen 実行補助 |

例示は Example TODO アプリを前提にする。実プロダクト名・実シークレットは含めない。

## 移行メモ

旧 `agent-skills` パッケージ内の `flutter-monolith-localization` は、
`pub-flutter-monolith-localization`（および runtime SKILL）へ移行した。
