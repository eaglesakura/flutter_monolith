A package that automatically generates JSON files for passing to the Dart `--dart-define` command and a `Defines` class for type-safe programmatic access.
It streamlines environment constant management for different flavors and build-time constant injection.

## Features

* **Flavor-based Constant Management**: Constant definition for development, production, and test environments
* **Automatic JSON File Generation**: Output JSON files for use with `--dart-define-from-file`
* **Type-safe Access**: Runtime constant access through the generated `Defines` class
* **Build Tool Integration**: Automatic integration with Flutter/Dart build processes

## Getting started

Configure the `define` section in `monolith.yaml`.

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

**JSON file example** (`secrets/dart-define/development.json`):
```json
{
  "FLAVOR": "development",
  "API_URL": "https://api-dev.example.com"
}
```

**Generated Defines class example**:
```dart
final class Defines {
  static String get FLAVOR { ... }
  
  static String get API_URL { ... }
}
```

**Usage at build time**:

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
It improves development efficiency and prevents human errors during release by managing environment-specific configuration values in a type-safe manner and automating build-time constant injection.

**Special functionality in test environments**:
- Automatically searches the workspace directory when running `flutter test`
- Dynamically loads constants from JSON files for test flavors
- Transparently switches between build-time constants and test-time constants

This enables consistent use of environment constants in unit tests and integration tests as well. 