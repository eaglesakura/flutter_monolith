// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pubspec_yaml_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PubspecYamlDto {

/// パッケージ名.
@JsonKey(name: 'name') String? get name;/// パッケージのバージョン.
@JsonKey(name: 'version') String? get version;/// パッケージの説明.
@JsonKey(name: 'description') String? get description;/// パッケージのリポジトリ.
@JsonKey(name: 'repository') String? get repository;/// パッケージのホームページ.
@JsonKey(name: 'homepage') String? get homepage;/// パッケージの依存関係.
@JsonKey(name: 'dependencies') Map<String, dynamic>? get dependencies;/// パッケージの開発依存関係.
@JsonKey(name: 'dev_dependencies') Map<String, dynamic>? get devDependencies;/// パッケージに含まれるworkspaceリスト
@JsonKey(name: 'workspace') List<String>? get workspace;
/// Create a copy of PubspecYamlDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PubspecYamlDtoCopyWith<PubspecYamlDto> get copyWith => _$PubspecYamlDtoCopyWithImpl<PubspecYamlDto>(this as PubspecYamlDto, _$identity);

  /// Serializes this PubspecYamlDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PubspecYamlDto&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.description, description) || other.description == description)&&(identical(other.repository, repository) || other.repository == repository)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other.dependencies, dependencies)&&const DeepCollectionEquality().equals(other.devDependencies, devDependencies)&&const DeepCollectionEquality().equals(other.workspace, workspace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,description,repository,homepage,const DeepCollectionEquality().hash(dependencies),const DeepCollectionEquality().hash(devDependencies),const DeepCollectionEquality().hash(workspace));

@override
String toString() {
  return 'PubspecYamlDto(name: $name, version: $version, description: $description, repository: $repository, homepage: $homepage, dependencies: $dependencies, devDependencies: $devDependencies, workspace: $workspace)';
}


}

/// @nodoc
abstract mixin class $PubspecYamlDtoCopyWith<$Res>  {
  factory $PubspecYamlDtoCopyWith(PubspecYamlDto value, $Res Function(PubspecYamlDto) _then) = _$PubspecYamlDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String? name,@JsonKey(name: 'version') String? version,@JsonKey(name: 'description') String? description,@JsonKey(name: 'repository') String? repository,@JsonKey(name: 'homepage') String? homepage,@JsonKey(name: 'dependencies') Map<String, dynamic>? dependencies,@JsonKey(name: 'dev_dependencies') Map<String, dynamic>? devDependencies,@JsonKey(name: 'workspace') List<String>? workspace
});




}
/// @nodoc
class _$PubspecYamlDtoCopyWithImpl<$Res>
    implements $PubspecYamlDtoCopyWith<$Res> {
  _$PubspecYamlDtoCopyWithImpl(this._self, this._then);

  final PubspecYamlDto _self;
  final $Res Function(PubspecYamlDto) _then;

/// Create a copy of PubspecYamlDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? version = freezed,Object? description = freezed,Object? repository = freezed,Object? homepage = freezed,Object? dependencies = freezed,Object? devDependencies = freezed,Object? workspace = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,repository: freezed == repository ? _self.repository : repository // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,dependencies: freezed == dependencies ? _self.dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,devDependencies: freezed == devDependencies ? _self.devDependencies : devDependencies // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,workspace: freezed == workspace ? _self.workspace : workspace // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PubspecYamlDto implements PubspecYamlDto {
  const _PubspecYamlDto({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'version') required this.version, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'repository') required this.repository, @JsonKey(name: 'homepage') required this.homepage, @JsonKey(name: 'dependencies') required final  Map<String, dynamic>? dependencies, @JsonKey(name: 'dev_dependencies') required final  Map<String, dynamic>? devDependencies, @JsonKey(name: 'workspace') required final  List<String>? workspace}): _dependencies = dependencies,_devDependencies = devDependencies,_workspace = workspace;
  factory _PubspecYamlDto.fromJson(Map<String, dynamic> json) => _$PubspecYamlDtoFromJson(json);

/// パッケージ名.
@override@JsonKey(name: 'name') final  String? name;
/// パッケージのバージョン.
@override@JsonKey(name: 'version') final  String? version;
/// パッケージの説明.
@override@JsonKey(name: 'description') final  String? description;
/// パッケージのリポジトリ.
@override@JsonKey(name: 'repository') final  String? repository;
/// パッケージのホームページ.
@override@JsonKey(name: 'homepage') final  String? homepage;
/// パッケージの依存関係.
 final  Map<String, dynamic>? _dependencies;
/// パッケージの依存関係.
@override@JsonKey(name: 'dependencies') Map<String, dynamic>? get dependencies {
  final value = _dependencies;
  if (value == null) return null;
  if (_dependencies is EqualUnmodifiableMapView) return _dependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// パッケージの開発依存関係.
 final  Map<String, dynamic>? _devDependencies;
/// パッケージの開発依存関係.
@override@JsonKey(name: 'dev_dependencies') Map<String, dynamic>? get devDependencies {
  final value = _devDependencies;
  if (value == null) return null;
  if (_devDependencies is EqualUnmodifiableMapView) return _devDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// パッケージに含まれるworkspaceリスト
 final  List<String>? _workspace;
/// パッケージに含まれるworkspaceリスト
@override@JsonKey(name: 'workspace') List<String>? get workspace {
  final value = _workspace;
  if (value == null) return null;
  if (_workspace is EqualUnmodifiableListView) return _workspace;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PubspecYamlDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PubspecYamlDtoCopyWith<_PubspecYamlDto> get copyWith => __$PubspecYamlDtoCopyWithImpl<_PubspecYamlDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PubspecYamlDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PubspecYamlDto&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.description, description) || other.description == description)&&(identical(other.repository, repository) || other.repository == repository)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&const DeepCollectionEquality().equals(other._dependencies, _dependencies)&&const DeepCollectionEquality().equals(other._devDependencies, _devDependencies)&&const DeepCollectionEquality().equals(other._workspace, _workspace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,description,repository,homepage,const DeepCollectionEquality().hash(_dependencies),const DeepCollectionEquality().hash(_devDependencies),const DeepCollectionEquality().hash(_workspace));

@override
String toString() {
  return 'PubspecYamlDto(name: $name, version: $version, description: $description, repository: $repository, homepage: $homepage, dependencies: $dependencies, devDependencies: $devDependencies, workspace: $workspace)';
}


}

/// @nodoc
abstract mixin class _$PubspecYamlDtoCopyWith<$Res> implements $PubspecYamlDtoCopyWith<$Res> {
  factory _$PubspecYamlDtoCopyWith(_PubspecYamlDto value, $Res Function(_PubspecYamlDto) _then) = __$PubspecYamlDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String? name,@JsonKey(name: 'version') String? version,@JsonKey(name: 'description') String? description,@JsonKey(name: 'repository') String? repository,@JsonKey(name: 'homepage') String? homepage,@JsonKey(name: 'dependencies') Map<String, dynamic>? dependencies,@JsonKey(name: 'dev_dependencies') Map<String, dynamic>? devDependencies,@JsonKey(name: 'workspace') List<String>? workspace
});




}
/// @nodoc
class __$PubspecYamlDtoCopyWithImpl<$Res>
    implements _$PubspecYamlDtoCopyWith<$Res> {
  __$PubspecYamlDtoCopyWithImpl(this._self, this._then);

  final _PubspecYamlDto _self;
  final $Res Function(_PubspecYamlDto) _then;

/// Create a copy of PubspecYamlDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? version = freezed,Object? description = freezed,Object? repository = freezed,Object? homepage = freezed,Object? dependencies = freezed,Object? devDependencies = freezed,Object? workspace = freezed,}) {
  return _then(_PubspecYamlDto(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,repository: freezed == repository ? _self.repository : repository // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,dependencies: freezed == dependencies ? _self._dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,devDependencies: freezed == devDependencies ? _self._devDependencies : devDependencies // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,workspace: freezed == workspace ? _self._workspace : workspace // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
