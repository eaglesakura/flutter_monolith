A project management library that supports the modular monolith structure for Flutter projects.
It automates the setup of development environments and task execution for Flutter applications using the `monolith.yaml` configuration file.

## Features

* **Dart Define Management**: Environment constant definition and code generation for each flavor
* **Internationalization Support**: Internationalization resource management for applications and packages
* **Xcode Project Generation**: Automated generation of project settings for iOS development
* **Secret File Management**: Secure distribution and installation of files containing sensitive information

## Getting started

Create a `monolith.yaml` configuration file in the project root and describe the necessary settings.
Integration with 1Password CLI and other secret management tools is also possible.

## Usage

Basic configuration example for `monolith.yaml`:

```yaml
includes:
  - secrets/monolith.yaml

define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    # optional, default: `test`
    test_flavor: test
  # required
  flavors:
    development:
      FLAVOR: development
    production:
      FLAVOR: production
    test:
      FLAVOR: development

localization:
  # required
  languages:
    - ja
    - en
  app:
    # required, module name
    package_name: app
    # optional, default: `lib/l10n/`
    arb_path: lib/l10n/
    # optional, default: `intl_app_`
    arb_file_prefix: intl_app_
    # optional, default: `L10nHelper`
    l10n_helper_class_name: L10nHelper
    # optional, default: `lib/l10n/l10n_helper.dart`
    l10n_helper_path: lib/l10n/l10n_helper.dart
  package:
    # required, path to packages(relative to root)
    path_prefixes:
      - app/
      - packages/
    # optional, default: `res/`
    resources_path: res/
    # optional, default: `L10nStringsMixin`
    module_helper_class_name: L10nStringsMixin
    # optional, default: `lib/gen/strings.dart`
    module_helper_path: lib/gen/strings.dart


xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist

install:
  - path: secrets/config.json
    text_file: |
      {"environment": "production"}
```

## Additional information

This package is optimized for projects that adopt the modular monolith structure for Flutter.
It streamlines the management of large-scale Flutter projects containing multiple packages,
enabling efficient configuration sharing and automated environment setup among development teams.

Please refer to the project documentation for detailed configuration options and usage instructions. 