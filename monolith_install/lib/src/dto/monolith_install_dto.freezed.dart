// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_install_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithInstallDto {

@JsonKey(name: 'path') String? get path;@JsonKey(name: 'base64_file') String? get base64File;@JsonKey(name: 'text_file') String? get textFile;@JsonKey(name: 'properties') Map<String, String>? get properties;
/// Create a copy of MonolithInstallDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithInstallDtoCopyWith<MonolithInstallDto> get copyWith => _$MonolithInstallDtoCopyWithImpl<MonolithInstallDto>(this as MonolithInstallDto, _$identity);

  /// Serializes this MonolithInstallDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithInstallDto&&(identical(other.path, path) || other.path == path)&&(identical(other.base64File, base64File) || other.base64File == base64File)&&(identical(other.textFile, textFile) || other.textFile == textFile)&&const DeepCollectionEquality().equals(other.properties, properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,base64File,textFile,const DeepCollectionEquality().hash(properties));

@override
String toString() {
  return 'MonolithInstallDto(path: $path, base64File: $base64File, textFile: $textFile, properties: $properties)';
}


}

/// @nodoc
abstract mixin class $MonolithInstallDtoCopyWith<$Res>  {
  factory $MonolithInstallDtoCopyWith(MonolithInstallDto value, $Res Function(MonolithInstallDto) _then) = _$MonolithInstallDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'path') String? path,@JsonKey(name: 'base64_file') String? base64File,@JsonKey(name: 'text_file') String? textFile,@JsonKey(name: 'properties') Map<String, String>? properties
});




}
/// @nodoc
class _$MonolithInstallDtoCopyWithImpl<$Res>
    implements $MonolithInstallDtoCopyWith<$Res> {
  _$MonolithInstallDtoCopyWithImpl(this._self, this._then);

  final MonolithInstallDto _self;
  final $Res Function(MonolithInstallDto) _then;

/// Create a copy of MonolithInstallDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = freezed,Object? base64File = freezed,Object? textFile = freezed,Object? properties = freezed,}) {
  return _then(_self.copyWith(
path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,base64File: freezed == base64File ? _self.base64File : base64File // ignore: cast_nullable_to_non_nullable
as String?,textFile: freezed == textFile ? _self.textFile : textFile // ignore: cast_nullable_to_non_nullable
as String?,properties: freezed == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithInstallDto implements MonolithInstallDto {
  const _MonolithInstallDto({@JsonKey(name: 'path') this.path, @JsonKey(name: 'base64_file') this.base64File, @JsonKey(name: 'text_file') this.textFile, @JsonKey(name: 'properties') final  Map<String, String>? properties}): _properties = properties;
  factory _MonolithInstallDto.fromJson(Map<String, dynamic> json) => _$MonolithInstallDtoFromJson(json);

@override@JsonKey(name: 'path') final  String? path;
@override@JsonKey(name: 'base64_file') final  String? base64File;
@override@JsonKey(name: 'text_file') final  String? textFile;
 final  Map<String, String>? _properties;
@override@JsonKey(name: 'properties') Map<String, String>? get properties {
  final value = _properties;
  if (value == null) return null;
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MonolithInstallDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithInstallDtoCopyWith<_MonolithInstallDto> get copyWith => __$MonolithInstallDtoCopyWithImpl<_MonolithInstallDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithInstallDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithInstallDto&&(identical(other.path, path) || other.path == path)&&(identical(other.base64File, base64File) || other.base64File == base64File)&&(identical(other.textFile, textFile) || other.textFile == textFile)&&const DeepCollectionEquality().equals(other._properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,base64File,textFile,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'MonolithInstallDto(path: $path, base64File: $base64File, textFile: $textFile, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$MonolithInstallDtoCopyWith<$Res> implements $MonolithInstallDtoCopyWith<$Res> {
  factory _$MonolithInstallDtoCopyWith(_MonolithInstallDto value, $Res Function(_MonolithInstallDto) _then) = __$MonolithInstallDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'path') String? path,@JsonKey(name: 'base64_file') String? base64File,@JsonKey(name: 'text_file') String? textFile,@JsonKey(name: 'properties') Map<String, String>? properties
});




}
/// @nodoc
class __$MonolithInstallDtoCopyWithImpl<$Res>
    implements _$MonolithInstallDtoCopyWith<$Res> {
  __$MonolithInstallDtoCopyWithImpl(this._self, this._then);

  final _MonolithInstallDto _self;
  final $Res Function(_MonolithInstallDto) _then;

/// Create a copy of MonolithInstallDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = freezed,Object? base64File = freezed,Object? textFile = freezed,Object? properties = freezed,}) {
  return _then(_MonolithInstallDto(
path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,base64File: freezed == base64File ? _self.base64File : base64File // ignore: cast_nullable_to_non_nullable
as String?,textFile: freezed == textFile ? _self.textFile : textFile // ignore: cast_nullable_to_non_nullable
as String?,properties: freezed == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
