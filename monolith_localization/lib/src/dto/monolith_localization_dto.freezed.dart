// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// 対応する言語
@JsonKey(name: 'languages') List<String> get languages;/// アプリパッケージ
@JsonKey(name: 'app') MonolithLocalizationAppDto get app;/// モジュールパッケージ
@JsonKey(name: 'package') MonolithLocalizationPackageDto get package;/// Unit Test 用ヘルパー生成設定. 省略時は生成しない.
@JsonKey(name: 'test_helper') MonolithLocalizationTestHelperDto? get testHelper;
/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithLocalizationDtoCopyWith<MonolithLocalizationDto> get copyWith => _$MonolithLocalizationDtoCopyWithImpl<MonolithLocalizationDto>(this as MonolithLocalizationDto, _$identity);

  /// Serializes this MonolithLocalizationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithLocalizationDto&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.app, app) || other.app == app)&&(identical(other.package, package) || other.package == package)&&(identical(other.testHelper, testHelper) || other.testHelper == testHelper));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(languages),app,package,testHelper);

@override
String toString() {
  return 'MonolithLocalizationDto(languages: $languages, app: $app, package: $package, testHelper: $testHelper)';
}


}

/// @nodoc
abstract mixin class $MonolithLocalizationDtoCopyWith<$Res>  {
  factory $MonolithLocalizationDtoCopyWith(MonolithLocalizationDto value, $Res Function(MonolithLocalizationDto) _then) = _$MonolithLocalizationDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'languages') List<String> languages,@JsonKey(name: 'app') MonolithLocalizationAppDto app,@JsonKey(name: 'package') MonolithLocalizationPackageDto package,@JsonKey(name: 'test_helper') MonolithLocalizationTestHelperDto? testHelper
});


$MonolithLocalizationAppDtoCopyWith<$Res> get app;$MonolithLocalizationPackageDtoCopyWith<$Res> get package;$MonolithLocalizationTestHelperDtoCopyWith<$Res>? get testHelper;

}
/// @nodoc
class _$MonolithLocalizationDtoCopyWithImpl<$Res>
    implements $MonolithLocalizationDtoCopyWith<$Res> {
  _$MonolithLocalizationDtoCopyWithImpl(this._self, this._then);

  final MonolithLocalizationDto _self;
  final $Res Function(MonolithLocalizationDto) _then;

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? languages = null,Object? app = null,Object? package = null,Object? testHelper = freezed,}) {
  return _then(_self.copyWith(
languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationAppDto,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationPackageDto,testHelper: freezed == testHelper ? _self.testHelper : testHelper // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationTestHelperDto?,
  ));
}
/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationAppDtoCopyWith<$Res> get app {
  
  return $MonolithLocalizationAppDtoCopyWith<$Res>(_self.app, (value) {
    return _then(_self.copyWith(app: value));
  });
}/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationPackageDtoCopyWith<$Res> get package {
  
  return $MonolithLocalizationPackageDtoCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationTestHelperDtoCopyWith<$Res>? get testHelper {
    if (_self.testHelper == null) {
    return null;
  }

  return $MonolithLocalizationTestHelperDtoCopyWith<$Res>(_self.testHelper!, (value) {
    return _then(_self.copyWith(testHelper: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonolithLocalizationDto].
extension MonolithLocalizationDtoPatterns on MonolithLocalizationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonolithLocalizationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonolithLocalizationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonolithLocalizationDto value)  $default,){
final _that = this;
switch (_that) {
case _MonolithLocalizationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonolithLocalizationDto value)?  $default,){
final _that = this;
switch (_that) {
case _MonolithLocalizationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'languages')  List<String> languages, @JsonKey(name: 'app')  MonolithLocalizationAppDto app, @JsonKey(name: 'package')  MonolithLocalizationPackageDto package, @JsonKey(name: 'test_helper')  MonolithLocalizationTestHelperDto? testHelper)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonolithLocalizationDto() when $default != null:
return $default(_that.languages,_that.app,_that.package,_that.testHelper);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'languages')  List<String> languages, @JsonKey(name: 'app')  MonolithLocalizationAppDto app, @JsonKey(name: 'package')  MonolithLocalizationPackageDto package, @JsonKey(name: 'test_helper')  MonolithLocalizationTestHelperDto? testHelper)  $default,) {final _that = this;
switch (_that) {
case _MonolithLocalizationDto():
return $default(_that.languages,_that.app,_that.package,_that.testHelper);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'languages')  List<String> languages, @JsonKey(name: 'app')  MonolithLocalizationAppDto app, @JsonKey(name: 'package')  MonolithLocalizationPackageDto package, @JsonKey(name: 'test_helper')  MonolithLocalizationTestHelperDto? testHelper)?  $default,) {final _that = this;
switch (_that) {
case _MonolithLocalizationDto() when $default != null:
return $default(_that.languages,_that.app,_that.package,_that.testHelper);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonolithLocalizationDto implements MonolithLocalizationDto {
  const _MonolithLocalizationDto({@JsonKey(name: 'languages') required final  List<String> languages, @JsonKey(name: 'app') required this.app, @JsonKey(name: 'package') required this.package, @JsonKey(name: 'test_helper') this.testHelper}): _languages = languages;
  factory _MonolithLocalizationDto.fromJson(Map<String, dynamic> json) => _$MonolithLocalizationDtoFromJson(json);

/// 対応する言語
 final  List<String> _languages;
/// 対応する言語
@override@JsonKey(name: 'languages') List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

/// アプリパッケージ
@override@JsonKey(name: 'app') final  MonolithLocalizationAppDto app;
/// モジュールパッケージ
@override@JsonKey(name: 'package') final  MonolithLocalizationPackageDto package;
/// Unit Test 用ヘルパー生成設定. 省略時は生成しない.
@override@JsonKey(name: 'test_helper') final  MonolithLocalizationTestHelperDto? testHelper;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithLocalizationDto&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.app, app) || other.app == app)&&(identical(other.package, package) || other.package == package)&&(identical(other.testHelper, testHelper) || other.testHelper == testHelper));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_languages),app,package,testHelper);

@override
String toString() {
  return 'MonolithLocalizationDto(languages: $languages, app: $app, package: $package, testHelper: $testHelper)';
}


}

/// @nodoc
abstract mixin class _$MonolithLocalizationDtoCopyWith<$Res> implements $MonolithLocalizationDtoCopyWith<$Res> {
  factory _$MonolithLocalizationDtoCopyWith(_MonolithLocalizationDto value, $Res Function(_MonolithLocalizationDto) _then) = __$MonolithLocalizationDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'languages') List<String> languages,@JsonKey(name: 'app') MonolithLocalizationAppDto app,@JsonKey(name: 'package') MonolithLocalizationPackageDto package,@JsonKey(name: 'test_helper') MonolithLocalizationTestHelperDto? testHelper
});


@override $MonolithLocalizationAppDtoCopyWith<$Res> get app;@override $MonolithLocalizationPackageDtoCopyWith<$Res> get package;@override $MonolithLocalizationTestHelperDtoCopyWith<$Res>? get testHelper;

}
/// @nodoc
class __$MonolithLocalizationDtoCopyWithImpl<$Res>
    implements _$MonolithLocalizationDtoCopyWith<$Res> {
  __$MonolithLocalizationDtoCopyWithImpl(this._self, this._then);

  final _MonolithLocalizationDto _self;
  final $Res Function(_MonolithLocalizationDto) _then;

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? languages = null,Object? app = null,Object? package = null,Object? testHelper = freezed,}) {
  return _then(_MonolithLocalizationDto(
languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationAppDto,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationPackageDto,testHelper: freezed == testHelper ? _self.testHelper : testHelper // ignore: cast_nullable_to_non_nullable
as MonolithLocalizationTestHelperDto?,
  ));
}

/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationAppDtoCopyWith<$Res> get app {
  
  return $MonolithLocalizationAppDtoCopyWith<$Res>(_self.app, (value) {
    return _then(_self.copyWith(app: value));
  });
}/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationPackageDtoCopyWith<$Res> get package {
  
  return $MonolithLocalizationPackageDtoCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}/// Create a copy of MonolithLocalizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithLocalizationTestHelperDtoCopyWith<$Res>? get testHelper {
    if (_self.testHelper == null) {
    return null;
  }

  return $MonolithLocalizationTestHelperDtoCopyWith<$Res>(_self.testHelper!, (value) {
    return _then(_self.copyWith(testHelper: value));
  });
}
}

// dart format on
