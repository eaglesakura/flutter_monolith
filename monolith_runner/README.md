A runner package for executing all monolith features from a unified command-line interface.
By adding it to `dev_dependencies`, you can access all monolith functionality through `dart run monolith:*` commands.

## Features

* **Unified Command Line**: Execute all monolith features with a consistent interface
* **Development Integration**: Simple integration through dev_dependencies
* **Automatic Feature Discovery**: Automatic detection and execution of available monolith features
* **Error Handling**: Appropriate error messages and help display

## Getting started

Add to the `dev_dependencies` section of your project's `pubspec.yaml`:

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

## Usage

**Available commands**:
```bash
# Install secret files
dart run monolith:install

# Generate localization resources
dart run monolith:localization

# Generate Dart Define constants
dart run monolith:define

# Generate Xcode project
dart run monolith:xcodegen
```

**CI/CD integration example**:
```yaml
# .github/workflows/build.yml
name: Build
on: [push, pull_request]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        
      - name: Install dependencies
        run: dart pub get
        
      - name: Setup development environment
        env:
          OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
        run: |
          op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
          dart run monolith:install
          dart run monolith:define
          dart run monolith:xcodegen
          
      - name: Build iOS
        run: flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## Additional information

This runner package is designed to streamline development workflows:

**Developer Experience Improvements**:
- **Unified Command System**: Easy-to-remember and consistent command naming
- **Incremental Execution**: Individual execution of only necessary features
- **Batch Execution**: Automated development environment setup

**CI/CD Environment Benefits**:
- **Error Handling**: Appropriate error codes and messages on failure
- **Log Output**: Clear display of progress and results

**Project Integration**:
- **Lightweight Integration**: Access to all features through dev_dependencies only
- **Configuration File Sharing**: Common use of `monolith.yaml` in project root
- **Version Management**: Centralized version management for monolith features

Streamlines the entire process from development to release as a unified entry point to maximize the utilization of the monolith library suite. 