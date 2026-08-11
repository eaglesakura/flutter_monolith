A package that supports module-level localization resource construction, which is not provided by Flutter's standard features.
It provides a mechanism for large-scale Flutter projects where each package can independently manage localization resources.

## Features

* **Module-independent Localization**: Each package manages its own localization resources
* **Unified Language Management**: Consistent language settings across the entire project
* **Automatic Code Generation**: Automatic Dart code generation from ARB files
* **Mixin Provision**: Localization resource sharing functionality between packages
* **Test Helper Generation**: Optional `StringsTestHelper` that embeds ARB JSON for Unit Test / Widget Preview / Golden Test

## Getting started

Describe multi-language settings in the `localization` section of `monolith.yaml`.
Application and package settings can be managed separately.

```yaml
# monolith.yaml
localization:
  # List of supported languages
  languages:
    - ja
    - en
  
  # Application settings
  app:
    package_name: app
    arb_path: lib/l10n/
    arb_file_prefix: intl_app_
    l10n_helper_class_name: L10nHelper
    l10n_helper_path: lib/l10n/l10n_helper.dart
  
  # Package settings
  package:
    path_prefixes:
      - app/
      - packages/
    resources_path: res/
    module_helper_class_name: L10nStringsMixin
    module_helper_path: lib/gen/strings.dart

  # Optional: Unit Test / Widget Preview / Golden Test helper
  # Omit this section to skip generation (backward compatible).
  test_helper:
    package_name: foundation_resources          # required: output package
    test_helper_class_name: StringsTestHelper   # optional, default: StringsTestHelper
    test_helper_path: lib/gen/strings_test_helper.dart  # optional, default: lib/gen/strings_test_helper.dart
```

## Usage

**Package Structure Example**:

```
packages/
├── domain/
│   └── user/
│       ├── res/
│       │   └── strings.csv
│       └── lib/
│           └── gen/
│               └── strings.dart  # Auto-generated
└── screen/
    └── login/
        ├── res/
│       │   └── strings.csv
        └── lib/
            └── gen/
                └── strings.dart  # Auto-generated
```

**CSV Resource File Example** (`packages/domain/user/res/strings.csv`):

```csv
id,ja,en,description
user_name,ユーザー名,User Name,ユーザー名
user_email,メールアドレス,Email Address,メールアドレス
user_profile,プロフィール,Profile,プロフィール
validation_email_required,メールアドレスは必須です,Email address is required,メールアドレスの必須入力バリデーション
validation_email_invalid,有効なメールアドレスを入力してください,Please enter a valid email address,メールアドレスの形式バリデーション
```

**Generated Dart Code Example**:

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

**Package Usage Example**:

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

**Application Integration Example**:

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
      // Each package's localization is automatically integrated
    );
  }
}
```

**Unit Test / Widget Preview / Golden Test (`StringsTestHelper`)**:

When `localization.test_helper` is configured, `dart run monolith_runner:localization` generates an ARB-embedded helper (Base64). Pass language getters to `LocalizeStringDelegate.injectDelegateForTest` without file I/O.

```dart
import 'package:foundation_resources/gen/strings_test_helper.dart';
import 'package:monolith_localization_runtime/monolith_localization_runtime.dart';

setUpAll(() async {
  await LocalizeStringDelegate.injectDelegateForTest(
    arbJson: StringsTestHelper.ja,
  );
});

tearDownAll(() async {
  await LocalizeStringDelegate.resetDelegateForTest();
});
```

* Do not call `StringsTestHelper` in release builds (throws `UnsupportedError`)
* Depend on the output package (e.g. `foundation_resources`) and `monolith_localization_runtime` from the test/preview package

## Additional information

This package is optimized for large-scale Flutter projects that adopt modular monolith structures.

**Traditional Challenges**:
* Flutter's standard internationalization features only support application level
* Each package cannot independently manage localization resources
* Difficulty in separating domain logic from localization resources

**Solutions by This Package**:
* Independent localization resource management per package
* Concise resource definition based on CSV files
* Type-safe access through automatic code generation
* Consistent language settings across the entire project

This enables domain packages and screen packages to have their own localization resources while achieving unified multi-language support across the entire application.
