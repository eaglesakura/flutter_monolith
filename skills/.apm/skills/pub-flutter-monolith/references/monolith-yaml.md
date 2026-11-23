# monolith.yaml 骨格（Example: TODO アプリ）

本ファイルは Example TODO アプリ向けの設定例である。実プロジェクトの vault ID・API キー・アプリ名は書かない。

## 全体例

```yaml
# monolith.yaml
# シークレット注入後の断片を取り込む場合
includes:
  - .secrets/monolith.secrets.yaml

define:
  # required: output_path / generate / flavors
  # generate.package_name / helper_path も required
  # generate.test_flavor は optional（default: test）。同名を flavors に置くこと
  # flavors の値はすべて文字列（DEBUG_MODE は "true" / "false"）
  output_path: .secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    test_flavor: test
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
      DEBUG_MODE: "true"
    production:
      FLAVOR: production
      API_URL: https://api.example.com
      DEBUG_MODE: "false"
    test:
      FLAVOR: development
      API_URL: https://api-test.example.com
      DEBUG_MODE: "true"

localization:
  # required: languages / app / package
  languages:
    - ja
    - en
  app:
    package_name: app
    arb_path: lib/l10n/
    arb_file_prefix: intl_app_
    l10n_helper_class_name: L10nHelper
    l10n_helper_path: lib/l10n/l10n_helper.dart
  package:
    path_prefixes:
      - app/
      - packages/
    resources_path: res/
    module_helper_class_name: L10nStringsMixin
    module_helper_path: lib/gen/strings.dart
  # optional — 省略時は StringsTestHelper を生成しない
  test_helper:
    package_name: foundation_resources
    test_helper_class_name: StringsTestHelper
    test_helper_path: lib/gen/strings_test_helper.dart

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    DEVELOPMENT_TEAM: ABCD123456

install:
  - path: .secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: .secrets/android.properties
    text_file: |
      android.projectName = TodoApp
      android.applicationId = com.example.todo_app
      android.keystore.password = op://vault-id/android-keystore/password
```

## セクションと担当 SKILL

| セクション | 担当 |
| --- | --- |
| `define` | `pub-flutter-monolith-define` |
| `localization` | `pub-flutter-monolith-localization` |
| `install` | `pub-flutter-monolith-install` |
| `xcodegen` | `pub-flutter-monolith-xcodegen` |
| 実行コマンド | `pub-flutter-monolith-runner` |

## includes の扱い

* `includes` 先はバージョン管理外（`.secrets/` 等）に置くことが多い
* テンプレート側の `monolith.yaml` はコミットし、実値は `op inject` 等で注入する
* 注入後の典型パスは `.secrets/monolith.secrets.yaml`（必要なら `.secrets/monolith.local.yaml` も追加）
* 注入後のファイルを `includes` で取り込むと、define / install / xcodegen が同じ実値を共有できる
