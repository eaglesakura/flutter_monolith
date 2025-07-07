// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_localization_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithLocalizationDto {

@JsonKey(name: 'languages') List<String>? get languages;/// モジュールヘルパーのクラス名.
/// デフォルトは `L10nStringsMixin` となる.
@JsonKey(name: 'module_helper_class_name') String? get moduleHelperClassName;/// ローカライゼーションヘルパーのパス.
/// デフォルトは `lib/gen/strings.dart` となる.
@JsonKey(name: 'module_helper_path') String? get moduleHelperPath;/// ARBファイルの出力先パス.
/// デフォルトは `lib/l10n/` となる.
@JsonKey(name: 'arb_path') String? get arbPath;/// L10nHelperのクラス名.
/// デフォルトは `L10nHelper` となる.
@JsonKey(name: 'l10n_helper_class_name') String? get l10nHelperClassName;/// ARBファイルのファイル名の接頭辞.
/// デフォルトは `intl_app_` となる.
@JsonKey(name: 'arb_file_prefix') String? get arbFilePrefix;/// L10nHelperのパス.
/// デフォルトは `lib/l10n/l10n_helper.dart` となる.
@JsonKey(name: 'l10n_helper_path') String? get l10nHelperPath;
/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithLocalizationDtoCopyWith<MonolithLocalizationDto> get copyWith => _$MonolithLocalizationDtoCopyWithImpl<MonolithLocalizationDto>(this as MonolithLocalizationDto, _$identity);

  /// Serializes this MonolithLocalizationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithLocalizationDto&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.moduleHelperClassName, moduleHelperClassName) || other.moduleHelperClassName == moduleHelperClassName)&&(identical(other.moduleHelperPath, moduleHelperPath) || other.moduleHelperPath == moduleHelperPath)&&(identical(other.arbPath, arbPath) || other.arbPath == arbPath)&&(identical(other.l10nHelperClassName, l10nHelperClassName) || other.l10nHelperClassName == l10nHelperClassName)&&(identical(other.arbFilePrefix, arbFilePrefix) || other.arbFilePrefix == arbFilePrefix)&&(identical(other.l10nHelperPath, l10nHelperPath) || other.l10nHelperPath == l10nHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(languages),moduleHelperClassName,moduleHelperPath,arbPath,l10nHelperClassName,arbFilePrefix,l10nHelperPath);

@override
String toString() {
  return 'MonolithLocalizationDto(languages: $languages, moduleHelperClassName: $moduleHelperClassName, moduleHelperPath: $moduleHelperPath, arbPath: $arbPath, l10nHelperClassName: $l10nHelperClassName, arbFilePrefix: $arbFilePrefix, l10nHelperPath: $l10nHelperPath)';
}


}

/// @nodoc
abstract mixin class $MonolithLocalizationDtoCopyWith<$Res>  {
  factory $MonolithLocalizationDtoCopyWith(MonolithLocalizationDto value, $Res Function(MonolithLocalizationDto) _then) = _$MonolithLocalizationDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'languages') List<String>? languages,@JsonKey(name: 'module_helper_class_name') String? moduleHelperClassName,@JsonKey(name: 'module_helper_path') String? moduleHelperPath,@JsonKey(name: 'arb_path') String? arbPath,@JsonKey(name: 'l10n_helper_class_name') String? l10nHelperClassName,@JsonKey(name: 'arb_file_prefix') String? arbFilePrefix,@JsonKey(name: 'l10n_helper_path') String? l10nHelperPath
});




}
/// @nodoc
class _$MonolithLocalizationDtoCopyWithImpl<$Res>
    implements $MonolithLocalizationDtoCopyWith<$Res> {
  _$MonolithLocalizationDtoCopyWithImpl(this._self, this._then);

  final MonolithLocalizationDto _self;
  final $Res Function(MonolithLocalizationDto) _then;

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? languages = freezed,Object? moduleHelperClassName = freezed,Object? moduleHelperPath = freezed,Object? arbPath = freezed,Object? l10nHelperClassName = freezed,Object? arbFilePrefix = freezed,Object? l10nHelperPath = freezed,}) {
  return _then(_self.copyWith(
languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,moduleHelperClassName: freezed == moduleHelperClassName ? _self.moduleHelperClassName : moduleHelperClassName // ignore: cast_nullable_to_non_nullable
as String?,moduleHelperPath: freezed == moduleHelperPath ? _self.moduleHelperPath : moduleHelperPath // ignore: cast_nullable_to_non_nullable
as String?,arbPath: freezed == arbPath ? _self.arbPath : arbPath // ignore: cast_nullable_to_non_nullable
as String?,l10nHelperClassName: freezed == l10nHelperClassName ? _self.l10nHelperClassName : l10nHelperClassName // ignore: cast_nullable_to_non_nullable
as String?,arbFilePrefix: freezed == arbFilePrefix ? _self.arbFilePrefix : arbFilePrefix // ignore: cast_nullable_to_non_nullable
as String?,l10nHelperPath: freezed == l10nHelperPath ? _self.l10nHelperPath : l10nHelperPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithLocalizationDto implements MonolithLocalizationDto {
  const _MonolithLocalizationDto({@JsonKey(name: 'languages') final  List<String>? languages, @JsonKey(name: 'module_helper_class_name') this.moduleHelperClassName, @JsonKey(name: 'module_helper_path') this.moduleHelperPath, @JsonKey(name: 'arb_path') this.arbPath, @JsonKey(name: 'l10n_helper_class_name') this.l10nHelperClassName, @JsonKey(name: 'arb_file_prefix') this.arbFilePrefix, @JsonKey(name: 'l10n_helper_path') this.l10nHelperPath}): _languages = languages;
  factory _MonolithLocalizationDto.fromJson(Map<String, dynamic> json) => _$MonolithLocalizationDtoFromJson(json);

 final  List<String>? _languages;
@override@JsonKey(name: 'languages') List<String>? get languages {
  final value = _languages;
  if (value == null) return null;
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// モジュールヘルパーのクラス名.
/// デフォルトは `L10nStringsMixin` となる.
@override@JsonKey(name: 'module_helper_class_name') final  String? moduleHelperClassName;
/// ローカライゼーションヘルパーのパス.
/// デフォルトは `lib/gen/strings.dart` となる.
@override@JsonKey(name: 'module_helper_path') final  String? moduleHelperPath;
/// ARBファイルの出力先パス.
/// デフォルトは `lib/l10n/` となる.
@override@JsonKey(name: 'arb_path') final  String? arbPath;
/// L10nHelperのクラス名.
/// デフォルトは `L10nHelper` となる.
@override@JsonKey(name: 'l10n_helper_class_name') final  String? l10nHelperClassName;
/// ARBファイルのファイル名の接頭辞.
/// デフォルトは `intl_app_` となる.
@override@JsonKey(name: 'arb_file_prefix') final  String? arbFilePrefix;
/// L10nHelperのパス.
/// デフォルトは `lib/l10n/l10n_helper.dart` となる.
@override@JsonKey(name: 'l10n_helper_path') final  String? l10nHelperPath;

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithLocalizationDtoCopyWith<_MonolithLocalizationDto> get copyWith => __$MonolithLocalizationDtoCopyWithImpl<_MonolithLocalizationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithLocalizationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithLocalizationDto&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.moduleHelperClassName, moduleHelperClassName) || other.moduleHelperClassName == moduleHelperClassName)&&(identical(other.moduleHelperPath, moduleHelperPath) || other.moduleHelperPath == moduleHelperPath)&&(identical(other.arbPath, arbPath) || other.arbPath == arbPath)&&(identical(other.l10nHelperClassName, l10nHelperClassName) || other.l10nHelperClassName == l10nHelperClassName)&&(identical(other.arbFilePrefix, arbFilePrefix) || other.arbFilePrefix == arbFilePrefix)&&(identical(other.l10nHelperPath, l10nHelperPath) || other.l10nHelperPath == l10nHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_languages),moduleHelperClassName,moduleHelperPath,arbPath,l10nHelperClassName,arbFilePrefix,l10nHelperPath);

@override
String toString() {
  return 'MonolithLocalizationDto(languages: $languages, moduleHelperClassName: $moduleHelperClassName, moduleHelperPath: $moduleHelperPath, arbPath: $arbPath, l10nHelperClassName: $l10nHelperClassName, arbFilePrefix: $arbFilePrefix, l10nHelperPath: $l10nHelperPath)';
}


}

/// @nodoc
abstract mixin class _$MonolithLocalizationDtoCopyWith<$Res> implements $MonolithLocalizationDtoCopyWith<$Res> {
  factory _$MonolithLocalizationDtoCopyWith(_MonolithLocalizationDto value, $Res Function(_MonolithLocalizationDto) _then) = __$MonolithLocalizationDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'languages') List<String>? languages,@JsonKey(name: 'module_helper_class_name') String? moduleHelperClassName,@JsonKey(name: 'module_helper_path') String? moduleHelperPath,@JsonKey(name: 'arb_path') String? arbPath,@JsonKey(name: 'l10n_helper_class_name') String? l10nHelperClassName,@JsonKey(name: 'arb_file_prefix') String? arbFilePrefix,@JsonKey(name: 'l10n_helper_path') String? l10nHelperPath
});




}
/// @nodoc
class __$MonolithLocalizationDtoCopyWithImpl<$Res>
    implements _$MonolithLocalizationDtoCopyWith<$Res> {
  __$MonolithLocalizationDtoCopyWithImpl(this._self, this._then);

  final _MonolithLocalizationDto _self;
  final $Res Function(_MonolithLocalizationDto) _then;

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? languages = freezed,Object? moduleHelperClassName = freezed,Object? moduleHelperPath = freezed,Object? arbPath = freezed,Object? l10nHelperClassName = freezed,Object? arbFilePrefix = freezed,Object? l10nHelperPath = freezed,}) {
  return _then(_MonolithLocalizationDto(
languages: freezed == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,moduleHelperClassName: freezed == moduleHelperClassName ? _self.moduleHelperClassName : moduleHelperClassName // ignore: cast_nullable_to_non_nullable
as String?,moduleHelperPath: freezed == moduleHelperPath ? _self.moduleHelperPath : moduleHelperPath // ignore: cast_nullable_to_non_nullable
as String?,arbPath: freezed == arbPath ? _self.arbPath : arbPath // ignore: cast_nullable_to_non_nullable
as String?,l10nHelperClassName: freezed == l10nHelperClassName ? _self.l10nHelperClassName : l10nHelperClassName // ignore: cast_nullable_to_non_nullable
as String?,arbFilePrefix: freezed == arbFilePrefix ? _self.arbFilePrefix : arbFilePrefix // ignore: cast_nullable_to_non_nullable
as String?,l10nHelperPath: freezed == l10nHelperPath ? _self.l10nHelperPath : l10nHelperPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
