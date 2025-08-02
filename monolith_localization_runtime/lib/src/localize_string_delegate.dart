import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

  /// ローカライズテキストのフォーマット.
  /// プロジェクト固有のテキスト整形を行う.
  /// 引数"source"はローカライズ完了した文字列が渡される.
  static String Function(String source) format = (source) {
    return source;
  };

  const LocalizeStringDelegate._();

  /// 指定したIDのローカライズテキストを取得する.
  static String get(
    String id, {
    List<String> arguments = const [],
  }) {
    return format(
      delegate(
        LocalizeStringSource(id, arguments),
      ),
    );
  }
}
