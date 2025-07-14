`monolith_localization`が生成したコードを実行時にサポートするランタイムライブラリである。
モジュール単位で管理されるローカライズリソースをFlutterアプリケーションで動的に読み込み、
型安全なアクセスを提供する。

## Features

* **動的ロケール切り替え**: アプリケーション実行時の言語変更サポート
* **メモリ効率化**: 必要な言語リソースのみを読み込み
* **Flutter統合**: 標準の国際化機能との透過的な連携
* **型安全アクセス**: 生成されたMixinクラスによる実行時型チェック

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
// packages/domain/user/lib/gen/strings.dart
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

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

**動的言語切り替え**:
```dart
class LanguageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => L10nHelper.setLocale(context, Locale('ja')),
          child: Text('日本語'),
        ),
        ElevatedButton(
          onPressed: () => L10nHelper.setLocale(context, Locale('en')),
          child: Text('English'),
        ),
      ],
    );
  }
}
```

## Additional information

このライブラリにより、`monolith_localization`で生成されたモジュール単位のローカライズコードが、
実際のFlutterアプリケーションで効率的に動作することが保証される。
