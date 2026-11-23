// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_localization_test_helper_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithLocalizationTestHelperDto {

/// 出力先パッケージ名
@JsonKey(name: 'package_name') String get packageName;/// 生成クラス名
@JsonKey(name: 'test_helper_class_name') String get testHelperClassName;/// パッケージルートからの相対パス
@JsonKey(name: 'test_helper_path') String get testHelperPath;
/// Create a copy of MonolithLocalizationTestHelperDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithLocalizationTestHelperDtoCopyWith<MonolithLocalizationTestHelperDto> get copyWith => _$MonolithLocalizationTestHelperDtoCopyWithImpl<MonolithLocalizationTestHelperDto>(this as MonolithLocalizationTestHelperDto, _$identity);

  /// Serializes this MonolithLocalizationTestHelperDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithLocalizationTestHelperDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.testHelperClassName, testHelperClassName) || other.testHelperClassName == testHelperClassName)&&(identical(other.testHelperPath, testHelperPath) || other.testHelperPath == testHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,testHelperClassName,testHelperPath);

@override
String toString() {
  return 'MonolithLocalizationTestHelperDto(packageName: $packageName, testHelperClassName: $testHelperClassName, testHelperPath: $testHelperPath)';
}


}

/// @nodoc
abstract mixin class $MonolithLocalizationTestHelperDtoCopyWith<$Res>  {
  factory $MonolithLocalizationTestHelperDtoCopyWith(MonolithLocalizationTestHelperDto value, $Res Function(MonolithLocalizationTestHelperDto) _then) = _$MonolithLocalizationTestHelperDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'test_helper_class_name') String testHelperClassName,@JsonKey(name: 'test_helper_path') String testHelperPath
});




}
/// @nodoc
class _$MonolithLocalizationTestHelperDtoCopyWithImpl<$Res>
    implements $MonolithLocalizationTestHelperDtoCopyWith<$Res> {
  _$MonolithLocalizationTestHelperDtoCopyWithImpl(this._self, this._then);

  final MonolithLocalizationTestHelperDto _self;
  final $Res Function(MonolithLocalizationTestHelperDto) _then;

/// Create a copy of MonolithLocalizationTestHelperDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? testHelperClassName = null,Object? testHelperPath = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,testHelperClassName: null == testHelperClassName ? _self.testHelperClassName : testHelperClassName // ignore: cast_nullable_to_non_nullable
as String,testHelperPath: null == testHelperPath ? _self.testHelperPath : testHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MonolithLocalizationTestHelperDto].
extension MonolithLocalizationTestHelperDtoPatterns on MonolithLocalizationTestHelperDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonolithLocalizationTestHelperDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonolithLocalizationTestHelperDto value)  $default,){
final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonolithLocalizationTestHelperDto value)?  $default,){
final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'test_helper_class_name')  String testHelperClassName, @JsonKey(name: 'test_helper_path')  String testHelperPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto() when $default != null:
return $default(_that.packageName,_that.testHelperClassName,_that.testHelperPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'test_helper_class_name')  String testHelperClassName, @JsonKey(name: 'test_helper_path')  String testHelperPath)  $default,) {final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto():
return $default(_that.packageName,_that.testHelperClassName,_that.testHelperPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'test_helper_class_name')  String testHelperClassName, @JsonKey(name: 'test_helper_path')  String testHelperPath)?  $default,) {final _that = this;
switch (_that) {
case _MonolithLocalizationTestHelperDto() when $default != null:
return $default(_that.packageName,_that.testHelperClassName,_that.testHelperPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonolithLocalizationTestHelperDto implements MonolithLocalizationTestHelperDto {
  const _MonolithLocalizationTestHelperDto({@JsonKey(name: 'package_name') required this.packageName, @JsonKey(name: 'test_helper_class_name') this.testHelperClassName = 'StringsTestHelper', @JsonKey(name: 'test_helper_path') this.testHelperPath = 'lib/gen/strings_test_helper.dart'});
  factory _MonolithLocalizationTestHelperDto.fromJson(Map<String, dynamic> json) => _$MonolithLocalizationTestHelperDtoFromJson(json);

/// 出力先パッケージ名
@override@JsonKey(name: 'package_name') final  String packageName;
/// 生成クラス名
@override@JsonKey(name: 'test_helper_class_name') final  String testHelperClassName;
/// パッケージルートからの相対パス
@override@JsonKey(name: 'test_helper_path') final  String testHelperPath;

/// Create a copy of MonolithLocalizationTestHelperDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithLocalizationTestHelperDtoCopyWith<_MonolithLocalizationTestHelperDto> get copyWith => __$MonolithLocalizationTestHelperDtoCopyWithImpl<_MonolithLocalizationTestHelperDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithLocalizationTestHelperDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithLocalizationTestHelperDto&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.testHelperClassName, testHelperClassName) || other.testHelperClassName == testHelperClassName)&&(identical(other.testHelperPath, testHelperPath) || other.testHelperPath == testHelperPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,testHelperClassName,testHelperPath);

@override
String toString() {
  return 'MonolithLocalizationTestHelperDto(packageName: $packageName, testHelperClassName: $testHelperClassName, testHelperPath: $testHelperPath)';
}


}

/// @nodoc
abstract mixin class _$MonolithLocalizationTestHelperDtoCopyWith<$Res> implements $MonolithLocalizationTestHelperDtoCopyWith<$Res> {
  factory _$MonolithLocalizationTestHelperDtoCopyWith(_MonolithLocalizationTestHelperDto value, $Res Function(_MonolithLocalizationTestHelperDto) _then) = __$MonolithLocalizationTestHelperDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'test_helper_class_name') String testHelperClassName,@JsonKey(name: 'test_helper_path') String testHelperPath
});




}
/// @nodoc
class __$MonolithLocalizationTestHelperDtoCopyWithImpl<$Res>
    implements _$MonolithLocalizationTestHelperDtoCopyWith<$Res> {
  __$MonolithLocalizationTestHelperDtoCopyWithImpl(this._self, this._then);

  final _MonolithLocalizationTestHelperDto _self;
  final $Res Function(_MonolithLocalizationTestHelperDto) _then;

/// Create a copy of MonolithLocalizationTestHelperDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? testHelperClassName = null,Object? testHelperPath = null,}) {
  return _then(_MonolithLocalizationTestHelperDto(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,testHelperClassName: null == testHelperClassName ? _self.testHelperClassName : testHelperClassName // ignore: cast_nullable_to_non_nullable
as String,testHelperPath: null == testHelperPath ? _self.testHelperPath : testHelperPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
