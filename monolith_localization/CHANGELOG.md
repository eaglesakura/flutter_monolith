## 1.1.1

- Updated `csv` dependency from `^6.0.0` to `^8.0.0`
- Migrated CSV decoding from deprecated `CsvCodec` to `Csv` (`lineDelimiter` / `decode`)
- Generated `L10nHelper` now imports `package:material_ui/material_ui.dart` instead of the deprecated `package:flutter/material.dart`
- Generated `localizationsDelegates` uses `GlobalMaterialLocalizations.delegates` from `material_ui`
- Apps that consume generated helpers must depend on `material_ui`
- Added unit tests that verify generated helper output and that it analyzes cleanly with `material_ui`

## 1.1.0

- Added optional `localization.test_helper` configuration to generate `StringsTestHelper`
- Generated helper embeds ARB JSON (Base64) per language for Unit Test / Widget Preview / Golden Test without file I/O
- Accessing `StringsTestHelper` getters in release mode throws `UnsupportedError`

## 1.0.2

- Fixed package path filtering logic and improved code comments in localization extensions

## 1.0.1

- Updated monolith dependency from 1.0.0 to 1.0.1

## 1.0.0

- Initial version.
