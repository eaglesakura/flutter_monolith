import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// monolithが生成したARBから、[LocalizeStringDelegate.delegate] 用のlookup tableを構築する.
///
/// NOTE.
/// `@@locale` および `@messageId` 形式のメタデータは登録対象外とする.
/// placeholderの置換順序は、テンプレート内の `{name}` 出現順に
/// [LocalizeStringSource.arguments] を対応づける.
///
/// Example:
/// ```dart
/// final arbJson = await File('lib/l10n/intl_app_ja.arb').readAsString();
/// final table = ArbDelegateLoader.load(arbJson);
/// ```
@internal
final class ArbDelegateLoader {
  const ArbDelegateLoader._();

  /// [arbJson] をパースし、メッセージIDごとのresolverを返す.
  ///
  /// 値が文字列で、かつキーが `@` で始まらないエントリのみ登録する.
  /// ルートがJSONオブジェクトでない場合は [FormatException] を投げる.
  ///
  /// [arbJson] monolithが生成したARBファイルのJSON文字列
  ///
  /// Example:
  /// ```dart
  /// final arbJson = await File('test/fixtures/test_ja.arb').readAsString();
  /// final table = ArbDelegateLoader.load(arbJson);
  /// final text = table['one_argument']!(
  ///   LocalizeStringSource('one_argument', ['太郎']),
  /// );
  /// ```
  static Map<String, String Function(LocalizeStringSource)> load(
    String arbJson,
  ) {
    // JSONとしてデコードする
    final json = jsonDecode(arbJson);
    // ルートがオブジェクトでなければ不正なARBとして扱う
    if (json is! Map<String, dynamic>) {
      throw const FormatException('ARB content must be a JSON object');
    }

    // メッセージIDとresolverの対応表を構築する
    final table = <String, String Function(LocalizeStringSource)>{};
    for (final entry in json.entries) {
      final key = entry.key;
      final value = entry.value;
      // メタデータキーおよび非文字列値はスキップする
      if (key.startsWith('@') || value is! String) {
        continue;
      }

      final template = value;
      // テンプレートからplaceholder名を抽出する
      final placeholderNames = _parsePlaceholders(template);
      // IDに対応するresolverを登録する
      table[key] = (source) => _formatTemplate(
        template,
        placeholderNames,
        source.arguments,
      );
    }

    return table;
  }

  /// テンプレート文字列からplaceholder名を出現順に抽出する.
  ///
  /// `{name}` 形式のブロックを対象とする.
  /// monolithのplaceholder抽出と同一ロジックである.
  ///
  /// [text] placeholderを含むテンプレート文字列
  ///
  /// Example:
  /// ```dart
  /// _parsePlaceholders('こんにちは {name}'); // ['name']
  /// ```
  static List<String> _parsePlaceholders(String text) {
    // `{name}` 形式のブロックを順に走査する
    return [
      ...RegExp('{.*?}').allMatches(text).map((match) {
        final group = match.group(0)!;
        // 波括弧を除いた名前をplaceholderとして取り出す
        return group.substring(1, group.length - 1);
      }),
    ];
  }

  /// テンプレート内のplaceholderを [arguments] の順序で文字列置換する.
  ///
  /// [arguments] の要素数がplaceholder数より少ない場合、不足分は空文字で埋める.
  ///
  /// [template] placeholderを含むテンプレート文字列
  /// [placeholderNames] 出現順のplaceholder名一覧
  /// [arguments] 置換に使う文字列引数
  ///
  /// Example:
  /// ```dart
  /// _formatTemplate(
  ///   '{lastName}{firstName}さん',
  ///   ['lastName', 'firstName'],
  ///   ['山田', '太郎'],
  /// ); // '山田太郎さん'
  /// ```
  static String _formatTemplate(
    String template,
    List<String> placeholderNames,
    List<String> arguments,
  ) {
    // 出現順にplaceholderを置換する
    var result = template;
    for (var i = 0; i < placeholderNames.length; i++) {
      // 引数が不足しているplaceholderは空文字で置換する
      final value = i < arguments.length ? arguments[i] : '';
      result = result.replaceAll('{${placeholderNames[i]}}', value);
    }
    return result;
  }
}
