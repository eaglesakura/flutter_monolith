import 'package:meta/meta.dart';
import 'package:monolith_localization_runtime/src/localize_string_source.dart';

/// ローカライズテキストを取得するための移譲クラス.
@internal
final class LocalizeStringDelegate {
  /// ローカライズされたテキストを取得するための関数.
  static String Function(LocalizeStringSource source) delegate = (source) {
    return source.id;
  };

  const LocalizeStringDelegate._();

  /// 指定したIDのローカライズテキストを取得する.
  static String get(
    String id, {
    List<String> arguments = const [],
  }) {
    return delegate(LocalizeStringSource(id, arguments));
  }
}
