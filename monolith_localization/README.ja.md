Flutter標準では提供されていないモジュール単位でのローカライズリソース構築をサポートするパッケージである。
大規模なFlutterプロジェクトにおいて、各パッケージが独立してローカライズリソースを管理できる仕組みを提供する。

## Features

* **モジュール独立型ローカライズ**: 各パッケージが独自のローカライズリソースを管理
* **統一言語管理**: プロジェクト全体で一貫した言語設定
* **自動コード生成**: ARBファイルからDartコードの自動生成
* **Mixin提供**: パッケージ間でのローカライズリソース共有機能

## Getting started

`monolith.yaml`の`localization`セクションで多言語設定を記述する。
アプリケーション用とパッケージ用の設定を分けて管理できる。

```yaml
# monolith.yaml
localization:
  # サポートする言語一覧
  languages:
    - ja
    - en
  
  # アプリケーション用設定
  app:
    package_name: app
    arb_path: lib/l10n/
    arb_file_prefix: intl_app_
    l10n_helper_class_name: L10nHelper
    l10n_helper_path: lib/l10n/l10n_helper.dart
  
  # パッケージ用設定
  package:
    path_prefixes:
      - app/
      - packages/
    resources_path: res/
    module_helper_class_name: L10nStringsMixin
    module_helper_path: lib/gen/strings.dart
```

## Usage

**パッケージ構造例**:
```
packages/
├── domain/
│   └── user/
│       ├── res/
│       │   └── strings.csv
│       └── lib/
│           └── gen/
│               └── strings.dart  # 自動生成
└── screen/
    └── login/
        ├── res/
│       │   └── strings.csv
        └── lib/
            └── gen/
                └── strings.dart  # 自動生成
```

**CSVリソースファイル例** (`packages/domain/user/res/strings.csv`):
```csv
id,ja,en,description
user_name,ユーザー名,User Name,ユーザー名
user_email,メールアドレス,Email Address,メールアドレス
user_profile,プロフィール,Profile,プロフィール
validation_email_required,メールアドレスは必須です,Email address is required,メールアドレスの必須入力バリデーション
validation_email_invalid,有効なメールアドレスを入力してください,Please enter a valid email address,メールアドレスの形式バリデーション
```

**生成されるDartコード例**:
```dart
// packages/domain/user/lib/gen/strings.dart
mixin L10nStringsMixin {
  String get user_name;
  String get user_email;
  String get user_profile;
  String get validation_email_required;
  String get validation_email_invalid;
}

```

**パッケージでの使用例**:
```dart
// packages/domain/user/lib/src/user_validator.dart
import '../gen/strings.dart';


final class _Strings with L10nStringsMixin {}

@internal
final strings = _Strings();


class UserValidator {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return strings.validation_email_required;
    }
    
    if (!_isValidEmail(email)) {
      return strings.validation_email_invalid;
    }
    
    return null;
  }
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
```

**アプリケーションでの統合例**:
```dart
// app/lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10nHelper.localizationsDelegates,
      supportedLocales: L10nHelper.supportedLocales,
      // 各パッケージのローカライズも自動的に連携
    );
  }
}
```

## Additional information

このパッケージはモジュラーモノリス構造を採用する大規模Flutterプロジェクトに最適化されている。

**従来の課題**:
- Flutter標準の国際化機能はアプリケーションレベルでのみサポート
- 各パッケージが独立してローカライズリソースを管理できない
- ドメインロジックとローカライズリソースの分離が困難

**本パッケージの解決策**:
- パッケージ単位での独立したローカライズリソース管理
- CSVファイルベースの簡潔なリソース定義
- 自動コード生成による型安全なアクセス
- プロジェクト全体での一貫した言語設定

これにより、ドメインパッケージやスクリーンパッケージがそれぞれ独自のローカライズリソースを持ちながら、
アプリケーション全体として統一された多言語対応を実現できる。
