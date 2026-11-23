## 1.1.0

- Generated `L10nHelper` now imports `package:material_ui/material_ui.dart` instead of the deprecated `package:flutter/material.dart`
- Generated `localizationsDelegates` uses `GlobalMaterialLocalizations.delegates` from `material_ui`
- Apps that consume generated helpers must depend on `material_ui`
- Added unit tests that verify generated helper output and that it analyzes cleanly with `material_ui`

## 1.0.2

- Fixed package path filtering logic and improved code comments in localization extensions

## 1.0.1

- Updated monolith dependency from 1.0.0 to 1.0.1

## 1.0.0

- Initial version.
