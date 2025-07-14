import 'dart:io';

import 'package:monolith_localization/monolith_localization.dart';
import 'package:monolith_localization/src/csv2arb/l10n_localized_text_table.dart';
import 'package:test/test.dart';

void main() {
  final testCsvFile = File('test/example.csv');
  test('CSVを読み込める', () async {
    final table = L10nLocalizedTextTable();
    table.addCsv(
      csvFile: testCsvFile,
      factory: (row) {
        final id = row['id']!;
        final en = row['en']!;
        final ja = row['ja']!;
        final description = row['description']!;
        final placeHolders = LocalizedText.parsePlaceholders(en);

        return LocalizedText(
          packageName: 'example',
          id: id,
          text: {
            'en': en,
            'ja': ja,
          },
          placeHolders: placeHolders,
          description: description,
        );
      },
    );

    expect(table.languages, equals(['en', 'ja']));
    {
      final withArgument = table.get('with_argument');
      expect(withArgument.placeHolders, equals(['name']));
    }

    // arbファイルを出力
    await table.generateArb(Directory('build/l10n'));
  });
}
