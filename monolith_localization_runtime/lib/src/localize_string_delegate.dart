import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

  /// ローカライズテキストの最適化.
  /// プロジェクト固有のテキスト整形を行う.
  static String Function(String source) optimize = (source) {
    return source;
  };

  const LocalizeStringDelegate._();

  /// 指定したIDのローカライズテキストを取得する.
  static String get(
    String id, {
    List<String> arguments = const [],
  }) {
    return optimize(
      delegate(
        LocalizeStringSource(id, arguments),
      ),
    );
  }
}
