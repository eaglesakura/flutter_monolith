`monolith_localization`が生成したコードを実行時にサポートするランタイムライブラリである。
モジュール単位で管理されるローカライズリソースを Flutter アプリケーションで動的に読み込み、
型安全なアクセスを提供する。

## Features

- **動的ロケール切り替え**: アプリケーション実行時の言語変更サポート
- **メモリ効率化**: 必要な言語リソースのみを読み込み
- **Flutter 統合**: 標準の国際化機能との透過的な連携
- **型安全アクセス**: 生成された Mixin クラスによる実行時型チェック
- **カスタマイズ可能なテキスト最適化**: プロジェクト固有のテキスト整形処理をサポート

## Getting started

このパッケージは`monolith_localization`によって生成されたコードと連携して動作する。
通常、開発者が直接このパッケージを操作することはない。

```yaml
# pubspec.yaml
dependencies:
  monolith_localization_runtime: ^1.0.0
```

## Usage

**生成されたコードとの連携例**:

```dart
// app_user_package
import 'package:path/to/gen/strings.dart';

final class _Strings with L10nStringsMixin {
  // ランタイムによる自動実装
}

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
}
```

**アプリケーションでの統合**:

```dart
// app/lib/main.dart
import 'package:flutter/material.dart';
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10nHelper.localizationsDelegates,
      supportedLocales: L10nHelper.supportedLocales,
      home: HomePage(),
    );
  }
}
```

**テキスト整形処理のカスタマイズ**:

```dart
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

Future<void> main() async {
  // ローカライズテキストの最適化設定
  LocalizeStringDelegate.format = _formatStringResource;
}

/// プロジェクト固有のテキスト整形処理
String _formatStringResource(String source) {
  // 改行文字の変換例
  return source.replaceAll(r'\n', '\n');
}
```

## Additional information

このライブラリにより、`monolith_localization`で生成されたモジュール単位のローカライズコードが、
実際の Flutter アプリケーションで効率的に動作することが保証される。
