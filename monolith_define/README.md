A package that automatically generates JSON files for Dart `--dart-define` commands and type-safe `Defines` classes for programmatic access.
It streamlines flavor-specific environment constant management and build-time constant injection.

## Features

* **Flavor-specific Constant Management**: Constant definitions for development, production, and test environments
* **Automatic JSON File Generation**: Output JSON files usable with `--dart-define-from-file`
* **Type-safe Access**: Runtime constant access through generated `Defines` classes
* **Build Tool Integration**: Automatic integration with Flutter/Dart build processes

## Getting started

Describe the configuration in the `define` section of `monolith.yaml`.

```yaml
# monolith.yaml
define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    # optional, default: `test`
    test_flavor: test
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

## Usage

The above configuration generates the following files:

**JSON File Example** (`secrets/dart-define/development.json`):
```json
{
  "FLAVOR": "development",
  "API_URL": "https://api-dev.example.com"
}
```

**Generated Defines Class Example**:
```dart
final class Defines {
  static String get FLAVOR { ... }
  
  static String get API_URL { ... }
}
```

**Usage at Build Time**:

```bash
# Build using JSON file
flutter build apk --dart-define-from-file=secrets/dart-define/production.json
```

# Programmatic Access

```dart
import 'package:foundation_metadata/gen/defines.dart';

void main() {
  print('Current flavor: ${Defines.FLAVOR}');
  print('API URL: ${Defines.API_URL}');
  
  if (Defines.FLAVOR == 'production') {
    // Production environment processing
  }
}
```

## Additional information

This package is optimized for multi-flavor development of Flutter applications.
It improves development efficiency and prevents human errors during release by providing type-safe management of environment-specific configuration values and automating build-time constant injection.

**Special Features for Test Environment**:
- Automatically searches workspace directory when running `flutter test`
- Dynamically loads constants from test flavor JSON files
- Transparently switches between build-time constants and test-time constants

**Directory Management**: The package automatically creates necessary directories when executing define tasks, ensuring proper file structure setup without manual operations.

This enables consistent use of environment constants in unit tests and integration tests as well. 