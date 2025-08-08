import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

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
