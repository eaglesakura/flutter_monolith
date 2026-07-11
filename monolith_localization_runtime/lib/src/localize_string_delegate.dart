import 'package:monolith_localization_runtime/src/arb_delegate_loader.dart';
import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

  /// テスト用に arb の JSON 文字列を [delegate] に注入する.
  /// テスト用途であり、通常は使用しない.
  ///
  /// Golden Test / Unit Test / Widget Preview 等で文言データを注入する場合に使用する.
  ///
  /// 推奨: monolith_localization が生成する `StringsTestHelper` の getter
  /// （例: `StringsTestHelper.ja`）を [arbJson] に渡す。ファイル I/O が不要になる.
  ///
  /// 代替: ARB ファイルを `readAsString()` して渡すこともできる.
  ///
  /// Example:
  /// ```dart
  /// await LocalizeStringDelegate.injectDelegateForTest(
  ///   arbJson: StringsTestHelper.ja,
  /// );
  /// ```
  static Future<void> injectDelegateForTest({
    /// ARB JSON 文字列. `StringsTestHelper` の言語 getter を渡すのが推奨.
    required String arbJson,
  }) async {
    final table = ArbDelegateLoader.load(arbJson);
    delegate = (source) {
      final resolver = table[source.id];
      if (resolver == null) {
        throw StateError('Unknown localize string id: ${source.id}');
      }
      return resolver(source);
    };
  }

  /// テスト用に [delegate] をリセットする.
  /// テスト用途であり、通常は使用しない.
  ///
  /// [injectDelegateForTest] で注入したデータをリセットする.
  static Future<void> resetDelegateForTest() async {
    delegate = (source) {
      return source.id;
    };
  }

  /// ローカライズテキストのフォーマット.
  /// プロジェクト固有のテキスト整形を行う.
  static String Function({
    required String id,
    required List<String> arguments,
    required String originalFormattedText,
  })
  format =
      ({
        required String id,
        required List<String> arguments,
        required String originalFormattedText,
      }) {
        return originalFormattedText;
      };

  const LocalizeStringDelegate._();

  /// 指定したIDのローカライズテキストを取得する.
  static String get(
    String id, {
    List<String> arguments = const [],
  }) {
    return format(
      id: id,
      arguments: arguments,
      originalFormattedText: delegate(
        LocalizeStringSource(id, arguments),
      ),
    );
  }
}
