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

@JsonKey(name: 'package_name') String get packageName;@JsonKey(name: 'helper_path') String get helperPath;@JsonKey(name: 'test_flavor') String get testFlavor;
/// Create a copy of MonolithDefinesGenerateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithDefinesGenerateDtoCopyWith<MonolithDefinesGenerateDto> get copyWith => _$MonolithDefinesGenerateDtoCopyWithImpl<MonolithDefinesGenerateDto>(this as MonolithDefinesGenerateDto, _$identity);

  /// Serializes this MonolithDefinesGenerateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithDefinesGenerateDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.helperPath, helperPath) || other.helperPath == helperPath)&&(identical(other.testFlavor, testFlavor) || other.testFlavor == testFlavor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,helperPath,testFlavor);

@override
String toString() {
  return 'MonolithDefinesGenerateDto(packageName: $packageName, helperPath: $helperPath, testFlavor: $testFlavor)';
}


}

/// @nodoc
abstract mixin class $MonolithDefinesGenerateDtoCopyWith<$Res>  {
  factory $MonolithDefinesGenerateDtoCopyWith(MonolithDefinesGenerateDto value, $Res Function(MonolithDefinesGenerateDto) _then) = _$MonolithDefinesGenerateDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'helper_path') String helperPath,@JsonKey(name: 'test_flavor') String testFlavor
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
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? helperPath = null,Object? testFlavor = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,helperPath: null == helperPath ? _self.helperPath : helperPath // ignore: cast_nullable_to_non_nullable
as String,testFlavor: null == testFlavor ? _self.testFlavor : testFlavor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithDefinesGenerateDto implements MonolithDefinesGenerateDto {
  const _MonolithDefinesGenerateDto({@JsonKey(name: 'package_name') required this.packageName, @JsonKey(name: 'helper_path') required this.helperPath, @JsonKey(name: 'test_flavor') this.testFlavor = 'test'});
  factory _MonolithDefinesGenerateDto.fromJson(Map<String, dynamic> json) => _$MonolithDefinesGenerateDtoFromJson(json);

@override@JsonKey(name: 'package_name') final  String packageName;
@override@JsonKey(name: 'helper_path') final  String helperPath;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithDefinesGenerateDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.helperPath, helperPath) || other.helperPath == helperPath)&&(identical(other.testFlavor, testFlavor) || other.testFlavor == testFlavor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,helperPath,testFlavor);

@override
String toString() {
  return 'MonolithDefinesGenerateDto(packageName: $packageName, helperPath: $helperPath, testFlavor: $testFlavor)';
}


}

/// @nodoc
abstract mixin class _$MonolithDefinesGenerateDtoCopyWith<$Res> implements $MonolithDefinesGenerateDtoCopyWith<$Res> {
  factory _$MonolithDefinesGenerateDtoCopyWith(_MonolithDefinesGenerateDto value, $Res Function(_MonolithDefinesGenerateDto) _then) = __$MonolithDefinesGenerateDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'helper_path') String helperPath,@JsonKey(name: 'test_flavor') String testFlavor
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
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? helperPath = null,Object? testFlavor = null,}) {
  return _then(_MonolithDefinesGenerateDto(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,helperPath: null == helperPath ? _self.helperPath : helperPath // ignore: cast_nullable_to_non_nullable
as String,testFlavor: null == testFlavor ? _self.testFlavor : testFlavor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
