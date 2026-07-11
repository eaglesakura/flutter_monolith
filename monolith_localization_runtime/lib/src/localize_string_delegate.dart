import 'package:monolith_localization_runtime/src/arb_delegate_loader.dart';
import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

  /// テスト用にarbファイルのJSON文字列を [delegate] に注入する.
  /// テスト用途であり、通常は使用しない.
  ///
  /// Golden Test(UI Test) 等で、CSVファイルのテキストデータを注入する必要がある場合に使用する.
  /// 呼び出し側で ARB ファイルを `readAsString()` したうえで渡すこと.
  static Future<void> injectDelegateForTest({
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
