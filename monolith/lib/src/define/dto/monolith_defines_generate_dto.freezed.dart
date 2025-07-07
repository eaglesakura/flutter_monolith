// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_defines_generate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithDefinesGenerateDto {

@JsonKey(name: 'helper_path') String get helperPath;@JsonKey(name: 'defines_path') String get definesPath;@JsonKey(name: 'root_file') String get rootFile;@JsonKey(name: 'test_flavor') String get testFlavor;
/// Create a copy of MonolithDefinesGenerateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithDefinesGenerateDtoCopyWith<MonolithDefinesGenerateDto> get copyWith => _$MonolithDefinesGenerateDtoCopyWithImpl<MonolithDefinesGenerateDto>(this as MonolithDefinesGenerateDto, _$identity);

  /// Serializes this MonolithDefinesGenerateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithDefinesGenerateDto&&(identical(other.helperPath, helperPath) || other.helperPath == helperPath)&&(identical(other.definesPath, definesPath) || other.definesPath == definesPath)&&(identical(other.rootFile, rootFile) || other.rootFile == rootFile)&&(identical(other.testFlavor, testFlavor) || other.testFlavor == testFlavor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,helperPath,definesPath,rootFile,testFlavor);

@override
String toString() {
  return 'MonolithDefinesGenerateDto(helperPath: $helperPath, definesPath: $definesPath, rootFile: $rootFile, testFlavor: $testFlavor)';
}


}

/// @nodoc
abstract mixin class $MonolithDefinesGenerateDtoCopyWith<$Res>  {
  factory $MonolithDefinesGenerateDtoCopyWith(MonolithDefinesGenerateDto value, $Res Function(MonolithDefinesGenerateDto) _then) = _$MonolithDefinesGenerateDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'helper_path') String helperPath,@JsonKey(name: 'defines_path') String definesPath,@JsonKey(name: 'root_file') String rootFile,@JsonKey(name: 'test_flavor') String testFlavor
});




}
/// @nodoc
class _$MonolithDefinesGenerateDtoCopyWithImpl<$Res>
    implements $MonolithDefinesGenerateDtoCopyWith<$Res> {
  _$MonolithDefinesGenerateDtoCopyWithImpl(this._self, this._then);

  final MonolithDefinesGenerateDto _self;
  final $Res Function(MonolithDefinesGenerateDto) _then;

/// Create a copy of MonolithDefinesGenerateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? helperPath = null,Object? definesPath = null,Object? rootFile = null,Object? testFlavor = null,}) {
  return _then(_self.copyWith(
helperPath: null == helperPath ? _self.helperPath : helperPath // ignore: cast_nullable_to_non_nullable
as String,definesPath: null == definesPath ? _self.definesPath : definesPath // ignore: cast_nullable_to_non_nullable
as String,rootFile: null == rootFile ? _self.rootFile : rootFile // ignore: cast_nullable_to_non_nullable
as String,testFlavor: null == testFlavor ? _self.testFlavor : testFlavor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithDefinesGenerateDto implements MonolithDefinesGenerateDto {
  const _MonolithDefinesGenerateDto({@JsonKey(name: 'helper_path') required this.helperPath, @JsonKey(name: 'defines_path') required this.definesPath, @JsonKey(name: 'root_file') this.rootFile = 'monolith.yaml', @JsonKey(name: 'test_flavor') this.testFlavor = 'test'});
  factory _MonolithDefinesGenerateDto.fromJson(Map<String, dynamic> json) => _$MonolithDefinesGenerateDtoFromJson(json);

@override@JsonKey(name: 'helper_path') final  String helperPath;
@override@JsonKey(name: 'defines_path') final  String definesPath;
@override@JsonKey(name: 'root_file') final  String rootFile;
@override@JsonKey(name: 'test_flavor') final  String testFlavor;

/// Create a copy of MonolithDefinesGenerateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithDefinesGenerateDtoCopyWith<_MonolithDefinesGenerateDto> get copyWith => __$MonolithDefinesGenerateDtoCopyWithImpl<_MonolithDefinesGenerateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithDefinesGenerateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithDefinesGenerateDto&&(identical(other.helperPath, helperPath) || other.helperPath == helperPath)&&(identical(other.definesPath, definesPath) || other.definesPath == definesPath)&&(identical(other.rootFile, rootFile) || other.rootFile == rootFile)&&(identical(other.testFlavor, testFlavor) || other.testFlavor == testFlavor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,helperPath,definesPath,rootFile,testFlavor);

@override
String toString() {
  return 'MonolithDefinesGenerateDto(helperPath: $helperPath, definesPath: $definesPath, rootFile: $rootFile, testFlavor: $testFlavor)';
}


}

/// @nodoc
abstract mixin class _$MonolithDefinesGenerateDtoCopyWith<$Res> implements $MonolithDefinesGenerateDtoCopyWith<$Res> {
  factory _$MonolithDefinesGenerateDtoCopyWith(_MonolithDefinesGenerateDto value, $Res Function(_MonolithDefinesGenerateDto) _then) = __$MonolithDefinesGenerateDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'helper_path') String helperPath,@JsonKey(name: 'defines_path') String definesPath,@JsonKey(name: 'root_file') String rootFile,@JsonKey(name: 'test_flavor') String testFlavor
});




}
/// @nodoc
class __$MonolithDefinesGenerateDtoCopyWithImpl<$Res>
    implements _$MonolithDefinesGenerateDtoCopyWith<$Res> {
  __$MonolithDefinesGenerateDtoCopyWithImpl(this._self, this._then);

  final _MonolithDefinesGenerateDto _self;
  final $Res Function(_MonolithDefinesGenerateDto) _then;

/// Create a copy of MonolithDefinesGenerateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? helperPath = null,Object? definesPath = null,Object? rootFile = null,Object? testFlavor = null,}) {
  return _then(_MonolithDefinesGenerateDto(
helperPath: null == helperPath ? _self.helperPath : helperPath // ignore: cast_nullable_to_non_nullable
as String,definesPath: null == definesPath ? _self.definesPath : definesPath // ignore: cast_nullable_to_non_nullable
as String,rootFile: null == rootFile ? _self.rootFile : rootFile // ignore: cast_nullable_to_non_nullable
as String,testFlavor: null == testFlavor ? _self.testFlavor : testFlavor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
