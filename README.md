# Flutter Monolith

![Flutter Monolith](./docs/res/monolith_logo.png)

An integrated project management toolset that supports modular monolith structures for Flutter projects.
It efficiently manages multiple packages in large-scale Flutter application development,
automating the entire process from development environment setup to production releases.

## 🚀 Challenges Solved

Large-scale Flutter projects face the following challenges:

### Complex Environment Management

- Cumbersome configuration management for different flavors
- Version control issues with confidential files
- Inconsistent environment setup among developers

### Localization Limitations

- Flutter's standard internationalization features are only at the application level
- Difficult to implement independent localization per package
- Cannot separate domain logic from translation resources

### iOS Development Complexity

- Manual management of Xcode project settings
- Distribution of certificates and provisioning profiles
- Difficulty in sharing configurations between teams

### Inefficient Project Management

- Tedious individual execution of each tool
- Complex configuration in CI/CD environments
- Lack of standardized development workflows

## ✨ Key Features

### 🔧 Integrated Project Management

- **monolith.yaml**: Centralized configuration management
- **Unified Runner**: Execute all features with `dart run monolith_runner:*` commands
- **CI/CD Optimization**: Automated development environment setup

### 🌍 Advanced Localization

- **Module-level Management**: Independent localization resources per package
- **CSV Management**: Multi-language resource definition in simple format
- **Type-safe Access**: Runtime guarantee through auto-generated Mixin classes

### 🔐 Secure Configuration Management

- **Secret Separation**: Exclude confidential files from version control
- **1Password Integration**: Integration with `op inject` command
- **Automatic Deployment**: Safe distribution of Base64 files and text files

### 📱 iOS Development Automation

- **xcodegen Integration**: YAML-based Xcode project generation
- **Environment Variable Injection**: Integration with secret management tools
- **File Creation**: Pre-creation of files necessary for builds

## 🛠 Development Environment (mise)

Flutter is managed with **mise** via `.mise.toml`.

```bash
# Install mise first: https://mise.jdx.dev/
mise install
mise exec -- flutter --version   # expect Flutter 3.50.0.x
mise exec -- dart pub get
mise exec -- flutter test
```

## Installing APM SKILLs

This repository root is an [APM (Agent Package Manager)](https://microsoft.github.io/apm/) package (`apm.yml` / `.apm/skills/`).
It ships agent-facing SKILLs that document how to use the [flutter_monolith](https://github.com/eaglesakura/flutter_monolith) packages in a consuming project.

APM CLI is required. If it is not installed yet, see [Installation](https://microsoft.github.io/apm/getting-started/installation/).

```bash
apm --version
```

From the consuming repository root, initialize once if needed:

```bash
apm init
```

Then add this package with either approach below. Pin a tag in production (recommended): `eaglesakura/flutter_monolith#v0.1.0`.

### Declare in `apm.yml`, then install

Edit the consuming project's `apm.yml` and list the package under `dependencies.apm`:

```yaml
name: my-app
version: 0.1.0
dependencies:
  apm:
    - eaglesakura/flutter_monolith#v0.1.0
    # Local path (development):
    # - ./path/to/flutter_monolith
```

Install (or restore after `git clone`):

```bash
apm install
```

### Install with a direct package argument

Pass the package to `apm install`. APM resolves it and updates `apm.yml` / `apm.lock.yaml`:

```bash
# GitHub shorthand
apm install eaglesakura/flutter_monolith

# Pin a tag (recommended)
apm install eaglesakura/flutter_monolith#v0.1.0

# Local path (development)
apm install ./path/to/flutter_monolith
```

### What to commit

Commit `apm.yml`, `apm.lock.yaml`, and `.gitignore` (plus any authored `.apm/`). Do not commit `apm_modules/`. Teammates restore dependencies with `apm install` after `git clone`.

### Shipped SKILLs

Located under `.apm/skills/`.

| SKILL | Scope |
| --- | --- |
| `flutter-use-monolith` | Overview, `monolith.yaml`, workflow |
| `flutter-use-monolith-runner` | `dart run monolith_runner:*` |
| `flutter-use-monolith-define` | Flavor / dart-define / `Defines` |
| `flutter-use-monolith-install` | Secret file deployment |
| `flutter-use-monolith-localization` | CSV → ARB / Mixin / StringsTestHelper |
| `flutter-use-monolith-localization-runtime` | Runtime and test injection APIs |
| `flutter-use-monolith-xcodegen` | xcodegen helpers |

Examples assume an Example TODO app. Do not include real product names or real secrets.

The former `flutter-monolith-localization` SKILL in the `agent-skills` package has moved to
`flutter-use-monolith-localization` (and the runtime SKILL).

## 🚀 Quick Start

### Installation

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

### Basic Configuration

Create `monolith.yaml` in the project root:

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

Use the mise-managed Flutter/Dart from Development Environment (mise) above when running tools in this repository.

```bash
# Inject secret data
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# Setup development environment
dart run monolith_runner:install        # Deploy secret files
dart run monolith_runner:define         # Generate environment constants
dart run monolith_runner:localization   # Generate localization resources
dart run monolith_runner:xcodegen       # Generate Xcode project

# Build application
flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 📦 Package Structure

### Core Packages

| Package             | Description     | Purpose                                              |
| ------------------- | --------------- | ---------------------------------------------------- |
| **monolith**        | Main library    | Project management and task execution control        |
| **monolith_runner** | Unified runner  | Provides `dart run monolith_runner:*` commands       |

### Feature Packages

| Package | Description | Key Features |
| --------- | ------------- | -------------- |
| **monolith_define** | Dart Define management | Flavor-specific environment constants and JSON file generation |
| **monolith_install** | Secret file deployment | Safe distribution and deployment of confidential files |
| **monolith_localization** | Module-level localization | Package-independent multi-language resource management |
| **monolith_localization_runtime** | Localization runtime | Runtime support for generated code |
| **monolith_xcodegen** | Xcode project generation | Automated Xcode project generation using xcodegen tool |

## 🏗️ Project Structure Example

```text
my_flutter_app/
├── monolith.yaml                    # Integrated configuration file
├── secrets/
│   ├── monolith.yaml               # Configuration after secret injection
│   └── dart-define/                # Generated environment constants
│       ├── development.json
│       └── production.json
├── app/                            # Main application
│   ├── lib/
│   │   ├── l10n/                   # Application-level localization
│   │   └── gen/
│   │       └── defines.dart        # Generated environment constant classes
│   └── ios/
│       └── Runner.xcodeproj        # Generated Xcode project
└── packages/                       # Domain and feature-specific packages
    ├── domain/
    │   └── user/
    │       ├── res/
    │       │   └── strings.csv     # Package-specific localization
    │       └── lib/
    │           └── gen/
    │               └── strings.dart # Generated localization classes
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
dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen
```

### 2. Daily Development

```bash
# Update localization resources
dart run monolith_runner:localization

# Add new environment constants
dart run monolith_runner:define

# Update iOS configurations
dart run monolith_runner:xcodegen
```

### 3. CI/CD Integration

```yaml
# .github/workflows/build.yml
- name: Setup development environment
  env:
    OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
  run: |
    op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
    dart run monolith_runner:install
    dart run monolith_runner:define
    dart run monolith_runner:xcodegen

- name: Build iOS
  run: flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 🤝 Target Projects

This toolset is ideal for Flutter projects that:

- Adopt **large-scale modular monolith structures**
- Involve **multiple developers and teams** in collaboration
- Have **multi-flavor** environments (development, production, etc.)
- Require **multi-language support**
- Target **both iOS and Android** mobile applications
- Emphasize **CI/CD** automation

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

## 🤝 Contributing

Issue reports and pull requests are welcome. For major changes,
we recommend discussing them in an Issue first.

---

By using **Flutter Monolith**, you can manage the complexity of large-scale Flutter projects
and significantly improve development efficiency. Leverage the benefits of modular monolith structure
to build scalable and maintainable Flutter applications.
