// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_localization_app_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithLocalizationAppDto {

/// パッケージ名
@JsonKey(name: 'package_name') String get packageName;/// ARBファイルの出力先パス
@JsonKey(name: 'arb_path') String get arbPath;/// ARBファイルのファイル名の接頭辞
@JsonKey(name: 'arb_file_prefix') String get arbFilePrefix;/// L10nHelperのクラス名
@JsonKey(name: 'l10n_helper_class_name') String get l10nHelperClassName;/// L10nHelperのパス
@JsonKey(name: 'l10n_helper_path') String get l10nHelperPath;
/// Create a copy of MonolithLocalizationAppDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithLocalizationAppDtoCopyWith<MonolithLocalizationAppDto> get copyWith => _$MonolithLocalizationAppDtoCopyWithImpl<MonolithLocalizationAppDto>(this as MonolithLocalizationAppDto, _$identity);

  /// Serializes this MonolithLocalizationAppDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithLocalizationAppDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.arbPath, arbPath) || other.arbPath == arbPath)&&(identical(other.arbFilePrefix, arbFilePrefix) || other.arbFilePrefix == arbFilePrefix)&&(identical(other.l10nHelperClassName, l10nHelperClassName) || other.l10nHelperClassName == l10nHelperClassName)&&(identical(other.l10nHelperPath, l10nHelperPath) || other.l10nHelperPath == l10nHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,arbPath,arbFilePrefix,l10nHelperClassName,l10nHelperPath);

@override
String toString() {
  return 'MonolithLocalizationAppDto(packageName: $packageName, arbPath: $arbPath, arbFilePrefix: $arbFilePrefix, l10nHelperClassName: $l10nHelperClassName, l10nHelperPath: $l10nHelperPath)';
}


}

/// @nodoc
abstract mixin class $MonolithLocalizationAppDtoCopyWith<$Res>  {
  factory $MonolithLocalizationAppDtoCopyWith(MonolithLocalizationAppDto value, $Res Function(MonolithLocalizationAppDto) _then) = _$MonolithLocalizationAppDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'arb_path') String arbPath,@JsonKey(name: 'arb_file_prefix') String arbFilePrefix,@JsonKey(name: 'l10n_helper_class_name') String l10nHelperClassName,@JsonKey(name: 'l10n_helper_path') String l10nHelperPath
});




}
/// @nodoc
class _$MonolithLocalizationAppDtoCopyWithImpl<$Res>
    implements $MonolithLocalizationAppDtoCopyWith<$Res> {
  _$MonolithLocalizationAppDtoCopyWithImpl(this._self, this._then);

  final MonolithLocalizationAppDto _self;
  final $Res Function(MonolithLocalizationAppDto) _then;

/// Create a copy of MonolithLocalizationAppDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? arbPath = null,Object? arbFilePrefix = null,Object? l10nHelperClassName = null,Object? l10nHelperPath = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,arbPath: null == arbPath ? _self.arbPath : arbPath // ignore: cast_nullable_to_non_nullable
as String,arbFilePrefix: null == arbFilePrefix ? _self.arbFilePrefix : arbFilePrefix // ignore: cast_nullable_to_non_nullable
as String,l10nHelperClassName: null == l10nHelperClassName ? _self.l10nHelperClassName : l10nHelperClassName // ignore: cast_nullable_to_non_nullable
as String,l10nHelperPath: null == l10nHelperPath ? _self.l10nHelperPath : l10nHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithLocalizationAppDto implements MonolithLocalizationAppDto {
  const _MonolithLocalizationAppDto({@JsonKey(name: 'package_name') required this.packageName, @JsonKey(name: 'arb_path') this.arbPath = 'lib/l10n/', @JsonKey(name: 'arb_file_prefix') this.arbFilePrefix = 'intl_app_', @JsonKey(name: 'l10n_helper_class_name') this.l10nHelperClassName = 'L10nHelper', @JsonKey(name: 'l10n_helper_path') this.l10nHelperPath = 'lib/l10n/l10n_helper.dart'});
  factory _MonolithLocalizationAppDto.fromJson(Map<String, dynamic> json) => _$MonolithLocalizationAppDtoFromJson(json);

/// パッケージ名
@override@JsonKey(name: 'package_name') final  String packageName;
/// ARBファイルの出力先パス
@override@JsonKey(name: 'arb_path') final  String arbPath;
/// ARBファイルのファイル名の接頭辞
@override@JsonKey(name: 'arb_file_prefix') final  String arbFilePrefix;
/// L10nHelperのクラス名
@override@JsonKey(name: 'l10n_helper_class_name') final  String l10nHelperClassName;
/// L10nHelperのパス
@override@JsonKey(name: 'l10n_helper_path') final  String l10nHelperPath;

/// Create a copy of MonolithLocalizationAppDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithLocalizationAppDtoCopyWith<_MonolithLocalizationAppDto> get copyWith => __$MonolithLocalizationAppDtoCopyWithImpl<_MonolithLocalizationAppDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithLocalizationAppDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithLocalizationAppDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.arbPath, arbPath) || other.arbPath == arbPath)&&(identical(other.arbFilePrefix, arbFilePrefix) || other.arbFilePrefix == arbFilePrefix)&&(identical(other.l10nHelperClassName, l10nHelperClassName) || other.l10nHelperClassName == l10nHelperClassName)&&(identical(other.l10nHelperPath, l10nHelperPath) || other.l10nHelperPath == l10nHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,arbPath,arbFilePrefix,l10nHelperClassName,l10nHelperPath);

@override
String toString() {
  return 'MonolithLocalizationAppDto(packageName: $packageName, arbPath: $arbPath, arbFilePrefix: $arbFilePrefix, l10nHelperClassName: $l10nHelperClassName, l10nHelperPath: $l10nHelperPath)';
}


}

/// @nodoc
abstract mixin class _$MonolithLocalizationAppDtoCopyWith<$Res> implements $MonolithLocalizationAppDtoCopyWith<$Res> {
  factory _$MonolithLocalizationAppDtoCopyWith(_MonolithLocalizationAppDto value, $Res Function(_MonolithLocalizationAppDto) _then) = __$MonolithLocalizationAppDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'arb_path') String arbPath,@JsonKey(name: 'arb_file_prefix') String arbFilePrefix,@JsonKey(name: 'l10n_helper_class_name') String l10nHelperClassName,@JsonKey(name: 'l10n_helper_path') String l10nHelperPath
});




}
/// @nodoc
class __$MonolithLocalizationAppDtoCopyWithImpl<$Res>
    implements _$MonolithLocalizationAppDtoCopyWith<$Res> {
  __$MonolithLocalizationAppDtoCopyWithImpl(this._self, this._then);

  final _MonolithLocalizationAppDto _self;
  final $Res Function(_MonolithLocalizationAppDto) _then;

/// Create a copy of MonolithLocalizationAppDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? arbPath = null,Object? arbFilePrefix = null,Object? l10nHelperClassName = null,Object? l10nHelperPath = null,}) {
  return _then(_MonolithLocalizationAppDto(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,arbPath: null == arbPath ? _self.arbPath : arbPath // ignore: cast_nullable_to_non_nullable
as String,arbFilePrefix: null == arbFilePrefix ? _self.arbFilePrefix : arbFilePrefix // ignore: cast_nullable_to_non_nullable
as String,l10nHelperClassName: null == l10nHelperClassName ? _self.l10nHelperClassName : l10nHelperClassName // ignore: cast_nullable_to_non_nullable
as String,l10nHelperPath: null == l10nHelperPath ? _self.l10nHelperPath : l10nHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
