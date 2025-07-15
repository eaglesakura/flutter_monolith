A package that supports building localization resources on a module basis, which is not provided by Flutter's standard features.
It provides a mechanism for each package to independently manage localization resources in large-scale Flutter projects.

## Features

* **Module-Independent Localization**: Each package manages its own localization resources
* **Unified Language Management**: Consistent language settings across the entire project
* **Automatic Code Generation**: Automatic generation of Dart code from ARB files
* **Mixin Support**: Localization resource sharing functionality between packages

## Getting started

Configure the multi-language settings in the `localization` section of `monolith.yaml`.
You can manage application and package configurations separately.

```yaml
# monolith.yaml
localization:
  # List of supported languages
  languages:
    - ja
    - en
  
  # Application configuration
  app:
    package_name: app
    arb_path: lib/l10n/
    arb_file_prefix: intl_app_
    l10n_helper_class_name: L10nHelper
    l10n_helper_path: lib/l10n/l10n_helper.dart
  
  # Package configuration
  package:
    path_prefixes:
      - app/
      - packages/
    resources_path: res/
    module_helper_class_name: L10nStringsMixin
    module_helper_path: lib/gen/strings.dart
```

## Usage

**Package structure example**:
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

**CSV resource file example** (`packages/domain/user/res/strings.csv`):
```csv
id,ja,en,description
user_name,ユーザー名,User Name,User name
user_email,メールアドレス,Email Address,Email address
user_profile,プロフィール,Profile,Profile
validation_email_required,メールアドレスは必須です,Email address is required,Email address required validation
validation_email_invalid,有効なメールアドレスを入力してください,Please enter a valid email address,Email address format validation
```

**Generated Dart code example**:
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

**Usage in package example**:
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

**Application integration example**:
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

## Additional information

This package is optimized for large-scale Flutter projects that adopt a modular monolith structure.

**Traditional challenges**:
- Flutter's standard internationalization features only support application-level functionality
- Each package cannot independently manage localization resources
- Difficulty in separating domain logic from localization resources

**Solutions provided by this package**:
- Independent localization resource management on a package basis
- Concise resource definition using CSV files
- Type-safe access through automatic code generation
- Consistent language settings across the entire project

This enables domain packages and screen packages to have their own localization resources while achieving unified multilingual support for the entire application. 