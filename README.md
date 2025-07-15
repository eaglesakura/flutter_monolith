# Flutter Monolith

![Flutter Monolith](./docs/res/monolith_logo.png)

An integrated project management toolset that supports the modular monolith structure for Flutter projects.
For large-scale Flutter application development, it efficiently manages multiple packages and automates the entire process from development environment setup to production release.

## 🚀 Problems Solved

Large-scale Flutter projects face the following challenges:

**Environment Management Complexity**
- Cumbersome configuration management for different flavors
- Version control issues with sensitive files
- Inconsistent environment setup among developers

**Localization Limitations**
- Flutter's standard internationalization features only work at the application level
- Difficult to implement independent localization per package
- Unable to separate domain logic from translation resources

**iOS Development Complexity**
- Manual management of Xcode project settings
- Distribution of certificates and provisioning profiles
- Difficulty in sharing settings among team members

**Project Management Inefficiency**
- The hassle of running each tool individually
- Complex configuration in CI/CD environments
- Lack of standardized development workflows

## ✨ Key Features

### 🔧 Integrated Project Management
- **monolith.yaml**: Centralized management of all configurations
- **Unified Runner**: Execute all features with `dart run monolith:*` commands
- **CI/CD Optimization**: Automated development environment setup

### 🌍 Advanced Localization
- **Module-level Management**: Independent localization resources per package
- **CSV Management**: Simple format for multi-language resource definition
- **Type-safe Access**: Runtime guarantees through auto-generated Mixin classes

### 🔐 Secure Configuration Management
- **Secret Separation**: Exclude sensitive files from version control
- **1Password Integration**: Integration with `op inject` command
- **Automatic Deployment**: Safe distribution of Base64 files and text files

### 📱 iOS Development Automation
- **xcodegen Integration**: YAML-based Xcode project generation
- **Environment Variable Injection**: Integration with secret management tools
- **File Creation**: Pre-creation of files needed for build

## 🚀 Quick Start

### Installation

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

### Basic Configuration

Create `monolith.yaml` in project root:

```yaml
# monolith.yaml
includes:
  - secrets/monolith.yaml

define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
    production:
      FLAVOR: production
      API_URL: https://api.example.com

localization:
  languages:
    - ja
    - en
  app:
    package_name: app
    arb_path: lib/l10n/
  package:
    path_prefixes:
      - packages/
    resources_path: res/

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist

install:
  - path: secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: app/ios/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

### Basic Usage

```bash
# Inject secret data
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# Setup development environment
dart run monolith:install        # Deploy secret files
dart run monolith:define         # Generate environment constants
dart run monolith:localization   # Generate localization resources
dart run monolith:xcodegen       # Generate Xcode project

# Build application
flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 📦 Package Structure

### Core Packages

| Package | Description | Purpose |
|---------|-------------|---------|
| **monolith** | Main library | Project management and task execution control |
| **monolith_runner** | Unified runner | Provides `dart run monolith:*` commands |

### Feature Packages

| Package | Description | Key Features |
|---------|-------------|--------------|
| **monolith_define** | Dart Define management | Flavor-specific environment constants and JSON file generation |
| **monolith_install** | Secret file deployment | Safe distribution and deployment of sensitive files |
| **monolith_localization** | Module-level localization | Package-independent multi-language resource management |
| **monolith_localization_runtime** | Localization runtime | Runtime support for generated code |
| **monolith_xcodegen** | Xcode project generation | Automatic Xcode project generation using xcodegen tool |

## 🏗️ Project Structure Example

```
my_flutter_app/
├── monolith.yaml                    # Integrated configuration file
├── secrets/
│   ├── monolith.yaml               # Configuration after secret injection
│   └── dart-define/                # Generated environment constants
│       ├── development.json
│       └── production.json
├── app/                            # Main application
│   ├── lib/
│   │   ├── l10n/                   # Application localization
│   │   └── gen/
│   │       └── defines.dart        # Generated environment constants class
│   └── ios/
│       └── Runner.xcodeproj        # Generated Xcode project
└── packages/                       # Domain and feature packages
    ├── domain/
    │   └── user/
    │       ├── res/
    │       │   └── strings.csv     # Package-specific localization
    │       └── lib/
    │           └── gen/
    │               └── strings.dart # Generated localization class
    └── screen/
        └── login/
            ├── res/
            │   └── strings.csv
            └── lib/
                └── gen/
                    └── strings.dart
```

## 🔄 Development Workflow

### 1. Initial Setup
```bash
# Install dependencies
dart pub get

# Setup development environment
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
dart run monolith:install
dart run monolith:define
dart run monolith:localization
dart run monolith:xcodegen
```

### 2. Daily Development
```bash
# Update localization resources
dart run monolith:localization

# Add new environment constants
dart run monolith:define

# Update iOS settings
dart run monolith:xcodegen
```

### 3. CI/CD Integration
```yaml
# .github/workflows/build.yml
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

## 🤝 Target Projects

This toolset is ideal for Flutter projects with the following characteristics:

- Projects adopting **large-scale modular monolith structure**
- Projects with **multiple developers and teams** collaborating
- Projects with **multi-flavor** support (development, production environments, etc.)
- Projects requiring **multi-language support**
- **iOS/Android cross-platform** mobile applications
- Projects emphasizing **CI/CD** automation

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

## 🤝 Contributing

Issue reports and pull requests are welcome. For major changes, 
it's recommended to first discuss them in an issue.

---

By using **Flutter Monolith**, you can manage the complexity of large-scale Flutter projects and significantly improve development efficiency. Maximize the benefits of modular monolith structure and build scalable, maintainable Flutter applications. 