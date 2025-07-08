// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_xcodegen_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithXcodegenDto {

/// パッケージ名
@JsonKey(name: 'package_name') String get packageName;/// 事前にtouchするファイル.
/// ファイルが作られていない場合、空ファイルを作成する.
@JsonKey(name: 'touch_files') List<String>? get touchFiles;/// 環境変数
@JsonKey(name: 'env') Map<String, String>? get env;
/// Create a copy of MonolithXcodegenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithXcodegenDtoCopyWith<MonolithXcodegenDto> get copyWith => _$MonolithXcodegenDtoCopyWithImpl<MonolithXcodegenDto>(this as MonolithXcodegenDto, _$identity);

  /// Serializes this MonolithXcodegenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithXcodegenDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other.touchFiles, touchFiles)&&const DeepCollectionEquality().equals(other.env, env));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,const DeepCollectionEquality().hash(touchFiles),const DeepCollectionEquality().hash(env));

@override
String toString() {
  return 'MonolithXcodegenDto(packageName: $packageName, touchFiles: $touchFiles, env: $env)';
}


}

/// @nodoc
abstract mixin class $MonolithXcodegenDtoCopyWith<$Res>  {
  factory $MonolithXcodegenDtoCopyWith(MonolithXcodegenDto value, $Res Function(MonolithXcodegenDto) _then) = _$MonolithXcodegenDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'touch_files') List<String>? touchFiles,@JsonKey(name: 'env') Map<String, String>? env
});




}
/// @nodoc
class _$MonolithXcodegenDtoCopyWithImpl<$Res>
    implements $MonolithXcodegenDtoCopyWith<$Res> {
  _$MonolithXcodegenDtoCopyWithImpl(this._self, this._then);

  final MonolithXcodegenDto _self;
  final $Res Function(MonolithXcodegenDto) _then;

/// Create a copy of MonolithXcodegenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? touchFiles = freezed,Object? env = freezed,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,touchFiles: freezed == touchFiles ? _self.touchFiles : touchFiles // ignore: cast_nullable_to_non_nullable
as List<String>?,env: freezed == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithXcodegenDto implements MonolithXcodegenDto {
  const _MonolithXcodegenDto({@JsonKey(name: 'package_name') required this.packageName, @JsonKey(name: 'touch_files') final  List<String>? touchFiles, @JsonKey(name: 'env') final  Map<String, String>? env}): _touchFiles = touchFiles,_env = env;
  factory _MonolithXcodegenDto.fromJson(Map<String, dynamic> json) => _$MonolithXcodegenDtoFromJson(json);

/// パッケージ名
@override@JsonKey(name: 'package_name') final  String packageName;
/// 事前にtouchするファイル.
/// ファイルが作られていない場合、空ファイルを作成する.
 final  List<String>? _touchFiles;
/// 事前にtouchするファイル.
/// ファイルが作られていない場合、空ファイルを作成する.
@override@JsonKey(name: 'touch_files') List<String>? get touchFiles {
  final value = _touchFiles;
  if (value == null) return null;
  if (_touchFiles is EqualUnmodifiableListView) return _touchFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// 環境変数
 final  Map<String, String>? _env;
/// 環境変数
@override@JsonKey(name: 'env') Map<String, String>? get env {
  final value = _env;
  if (value == null) return null;
  if (_env is EqualUnmodifiableMapView) return _env;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MonolithXcodegenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithXcodegenDtoCopyWith<_MonolithXcodegenDto> get copyWith => __$MonolithXcodegenDtoCopyWithImpl<_MonolithXcodegenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithXcodegenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithXcodegenDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other._touchFiles, _touchFiles)&&const DeepCollectionEquality().equals(other._env, _env));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,const DeepCollectionEquality().hash(_touchFiles),const DeepCollectionEquality().hash(_env));

@override
String toString() {
  return 'MonolithXcodegenDto(packageName: $packageName, touchFiles: $touchFiles, env: $env)';
}


}

/// @nodoc
abstract mixin class _$MonolithXcodegenDtoCopyWith<$Res> implements $MonolithXcodegenDtoCopyWith<$Res> {
  factory _$MonolithXcodegenDtoCopyWith(_MonolithXcodegenDto value, $Res Function(_MonolithXcodegenDto) _then) = __$MonolithXcodegenDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'touch_files') List<String>? touchFiles,@JsonKey(name: 'env') Map<String, String>? env
});




}
/// @nodoc
class __$MonolithXcodegenDtoCopyWithImpl<$Res>
    implements _$MonolithXcodegenDtoCopyWith<$Res> {
  __$MonolithXcodegenDtoCopyWithImpl(this._self, this._then);

  final _MonolithXcodegenDto _self;
  final $Res Function(_MonolithXcodegenDto) _then;

/// Create a copy of MonolithXcodegenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? touchFiles = freezed,Object? env = freezed,}) {
  return _then(_MonolithXcodegenDto(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,touchFiles: freezed == touchFiles ? _self._touchFiles : touchFiles // ignore: cast_nullable_to_non_nullable
as List<String>?,env: freezed == env ? _self._env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
