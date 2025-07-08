// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_localization_package_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithLocalizationPackageDto {

/// パッケージ名
@JsonKey(name: 'path_prefixes') List<String> get pathPrefixes;/// リソースパス
@JsonKey(name: 'resources_path') String get resourcesPath;/// モジュールヘルパーのクラス名
@JsonKey(name: 'module_helper_class_name') String get moduleHelperClassName;/// モジュールヘルパーのパス
@JsonKey(name: 'module_helper_path') String get moduleHelperPath;
/// Create a copy of MonolithLocalizationPackageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithLocalizationPackageDtoCopyWith<MonolithLocalizationPackageDto> get copyWith => _$MonolithLocalizationPackageDtoCopyWithImpl<MonolithLocalizationPackageDto>(this as MonolithLocalizationPackageDto, _$identity);

  /// Serializes this MonolithLocalizationPackageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithLocalizationPackageDto&&const DeepCollectionEquality().equals(other.pathPrefixes, pathPrefixes)&&(identical(other.resourcesPath, resourcesPath) || other.resourcesPath == resourcesPath)&&(identical(other.moduleHelperClassName, moduleHelperClassName) || other.moduleHelperClassName == moduleHelperClassName)&&(identical(other.moduleHelperPath, moduleHelperPath) || other.moduleHelperPath == moduleHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pathPrefixes),resourcesPath,moduleHelperClassName,moduleHelperPath);

@override
String toString() {
  return 'MonolithLocalizationPackageDto(pathPrefixes: $pathPrefixes, resourcesPath: $resourcesPath, moduleHelperClassName: $moduleHelperClassName, moduleHelperPath: $moduleHelperPath)';
}


}

/// @nodoc
abstract mixin class $MonolithLocalizationPackageDtoCopyWith<$Res>  {
  factory $MonolithLocalizationPackageDtoCopyWith(MonolithLocalizationPackageDto value, $Res Function(MonolithLocalizationPackageDto) _then) = _$MonolithLocalizationPackageDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'path_prefixes') List<String> pathPrefixes,@JsonKey(name: 'resources_path') String resourcesPath,@JsonKey(name: 'module_helper_class_name') String moduleHelperClassName,@JsonKey(name: 'module_helper_path') String moduleHelperPath
});




}
/// @nodoc
class _$MonolithLocalizationPackageDtoCopyWithImpl<$Res>
    implements $MonolithLocalizationPackageDtoCopyWith<$Res> {
  _$MonolithLocalizationPackageDtoCopyWithImpl(this._self, this._then);

  final MonolithLocalizationPackageDto _self;
  final $Res Function(MonolithLocalizationPackageDto) _then;

/// Create a copy of MonolithLocalizationPackageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pathPrefixes = null,Object? resourcesPath = null,Object? moduleHelperClassName = null,Object? moduleHelperPath = null,}) {
  return _then(_self.copyWith(
pathPrefixes: null == pathPrefixes ? _self.pathPrefixes : pathPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>,resourcesPath: null == resourcesPath ? _self.resourcesPath : resourcesPath // ignore: cast_nullable_to_non_nullable
as String,moduleHelperClassName: null == moduleHelperClassName ? _self.moduleHelperClassName : moduleHelperClassName // ignore: cast_nullable_to_non_nullable
as String,moduleHelperPath: null == moduleHelperPath ? _self.moduleHelperPath : moduleHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithLocalizationPackageDto implements MonolithLocalizationPackageDto {
  const _MonolithLocalizationPackageDto({@JsonKey(name: 'path_prefixes') required final  List<String> pathPrefixes, @JsonKey(name: 'resources_path') this.resourcesPath = 'res/', @JsonKey(name: 'module_helper_class_name') this.moduleHelperClassName = 'L10nStringsMixin', @JsonKey(name: 'module_helper_path') this.moduleHelperPath = 'lib/gen/strings.dart'}): _pathPrefixes = pathPrefixes;
  factory _MonolithLocalizationPackageDto.fromJson(Map<String, dynamic> json) => _$MonolithLocalizationPackageDtoFromJson(json);

/// パッケージ名
 final  List<String> _pathPrefixes;
/// パッケージ名
@override@JsonKey(name: 'path_prefixes') List<String> get pathPrefixes {
  if (_pathPrefixes is EqualUnmodifiableListView) return _pathPrefixes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pathPrefixes);
}

/// リソースパス
@override@JsonKey(name: 'resources_path') final  String resourcesPath;
/// モジュールヘルパーのクラス名
@override@JsonKey(name: 'module_helper_class_name') final  String moduleHelperClassName;
/// モジュールヘルパーのパス
@override@JsonKey(name: 'module_helper_path') final  String moduleHelperPath;

/// Create a copy of MonolithLocalizationPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithLocalizationPackageDtoCopyWith<_MonolithLocalizationPackageDto> get copyWith => __$MonolithLocalizationPackageDtoCopyWithImpl<_MonolithLocalizationPackageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithLocalizationPackageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithLocalizationPackageDto&&const DeepCollectionEquality().equals(other._pathPrefixes, _pathPrefixes)&&(identical(other.resourcesPath, resourcesPath) || other.resourcesPath == resourcesPath)&&(identical(other.moduleHelperClassName, moduleHelperClassName) || other.moduleHelperClassName == moduleHelperClassName)&&(identical(other.moduleHelperPath, moduleHelperPath) || other.moduleHelperPath == moduleHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pathPrefixes),resourcesPath,moduleHelperClassName,moduleHelperPath);

@override
String toString() {
  return 'MonolithLocalizationPackageDto(pathPrefixes: $pathPrefixes, resourcesPath: $resourcesPath, moduleHelperClassName: $moduleHelperClassName, moduleHelperPath: $moduleHelperPath)';
}


}

/// @nodoc
abstract mixin class _$MonolithLocalizationPackageDtoCopyWith<$Res> implements $MonolithLocalizationPackageDtoCopyWith<$Res> {
  factory _$MonolithLocalizationPackageDtoCopyWith(_MonolithLocalizationPackageDto value, $Res Function(_MonolithLocalizationPackageDto) _then) = __$MonolithLocalizationPackageDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'path_prefixes') List<String> pathPrefixes,@JsonKey(name: 'resources_path') String resourcesPath,@JsonKey(name: 'module_helper_class_name') String moduleHelperClassName,@JsonKey(name: 'module_helper_path') String moduleHelperPath
});




}
/// @nodoc
class __$MonolithLocalizationPackageDtoCopyWithImpl<$Res>
    implements _$MonolithLocalizationPackageDtoCopyWith<$Res> {
  __$MonolithLocalizationPackageDtoCopyWithImpl(this._self, this._then);

  final _MonolithLocalizationPackageDto _self;
  final $Res Function(_MonolithLocalizationPackageDto) _then;

/// Create a copy of MonolithLocalizationPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pathPrefixes = null,Object? resourcesPath = null,Object? moduleHelperClassName = null,Object? moduleHelperPath = null,}) {
  return _then(_MonolithLocalizationPackageDto(
pathPrefixes: null == pathPrefixes ? _self._pathPrefixes : pathPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>,resourcesPath: null == resourcesPath ? _self.resourcesPath : resourcesPath // ignore: cast_nullable_to_non_nullable
as String,moduleHelperClassName: null == moduleHelperClassName ? _self.moduleHelperClassName : moduleHelperClassName // ignore: cast_nullable_to_non_nullable
as String,moduleHelperPath: null == moduleHelperPath ? _self.moduleHelperPath : moduleHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
