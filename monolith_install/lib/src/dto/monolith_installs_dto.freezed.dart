// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_installs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithInstallsDto {

@JsonKey(name: 'install') List<MonolithInstallDto>? get installs;
/// Create a copy of MonolithInstallsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithInstallsDtoCopyWith<MonolithInstallsDto> get copyWith => _$MonolithInstallsDtoCopyWithImpl<MonolithInstallsDto>(this as MonolithInstallsDto, _$identity);

  /// Serializes this MonolithInstallsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithInstallsDto&&const DeepCollectionEquality().equals(other.installs, installs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(installs));

@override
String toString() {
  return 'MonolithInstallsDto(installs: $installs)';
}


}

/// @nodoc
abstract mixin class $MonolithInstallsDtoCopyWith<$Res>  {
  factory $MonolithInstallsDtoCopyWith(MonolithInstallsDto value, $Res Function(MonolithInstallsDto) _then) = _$MonolithInstallsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'install') List<MonolithInstallDto>? installs
});




}
/// @nodoc
class _$MonolithInstallsDtoCopyWithImpl<$Res>
    implements $MonolithInstallsDtoCopyWith<$Res> {
  _$MonolithInstallsDtoCopyWithImpl(this._self, this._then);

  final MonolithInstallsDto _self;
  final $Res Function(MonolithInstallsDto) _then;

/// Create a copy of MonolithInstallsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? installs = freezed,}) {
  return _then(_self.copyWith(
installs: freezed == installs ? _self.installs : installs // ignore: cast_nullable_to_non_nullable
as List<MonolithInstallDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MonolithInstallsDto].
extension MonolithInstallsDtoPatterns on MonolithInstallsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonolithInstallsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonolithInstallsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonolithInstallsDto value)  $default,){
final _that = this;
switch (_that) {
case _MonolithInstallsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonolithInstallsDto value)?  $default,){
final _that = this;
switch (_that) {
case _MonolithInstallsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'install')  List<MonolithInstallDto>? installs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonolithInstallsDto() when $default != null:
return $default(_that.installs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'install')  List<MonolithInstallDto>? installs)  $default,) {final _that = this;
switch (_that) {
case _MonolithInstallsDto():
return $default(_that.installs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'install')  List<MonolithInstallDto>? installs)?  $default,) {final _that = this;
switch (_that) {
case _MonolithInstallsDto() when $default != null:
return $default(_that.installs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonolithInstallsDto implements MonolithInstallsDto {
  const _MonolithInstallsDto({@JsonKey(name: 'install') final  List<MonolithInstallDto>? installs}): _installs = installs;
  factory _MonolithInstallsDto.fromJson(Map<String, dynamic> json) => _$MonolithInstallsDtoFromJson(json);

 final  List<MonolithInstallDto>? _installs;
@override@JsonKey(name: 'install') List<MonolithInstallDto>? get installs {
  final value = _installs;
  if (value == null) return null;
  if (_installs is EqualUnmodifiableListView) return _installs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MonolithInstallsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithInstallsDtoCopyWith<_MonolithInstallsDto> get copyWith => __$MonolithInstallsDtoCopyWithImpl<_MonolithInstallsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithInstallsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithInstallsDto&&const DeepCollectionEquality().equals(other._installs, _installs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_installs));

@override
String toString() {
  return 'MonolithInstallsDto(installs: $installs)';
}


}

/// @nodoc
abstract mixin class _$MonolithInstallsDtoCopyWith<$Res> implements $MonolithInstallsDtoCopyWith<$Res> {
  factory _$MonolithInstallsDtoCopyWith(_MonolithInstallsDto value, $Res Function(_MonolithInstallsDto) _then) = __$MonolithInstallsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'install') List<MonolithInstallDto>? installs
});




}
/// @nodoc
class __$MonolithInstallsDtoCopyWithImpl<$Res>
    implements _$MonolithInstallsDtoCopyWith<$Res> {
  __$MonolithInstallsDtoCopyWithImpl(this._self, this._then);

  final _MonolithInstallsDto _self;
  final $Res Function(_MonolithInstallsDto) _then;

/// Create a copy of MonolithInstallsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? installs = freezed,}) {
  return _then(_MonolithInstallsDto(
installs: freezed == installs ? _self._installs : installs // ignore: cast_nullable_to_non_nullable
as List<MonolithInstallDto>?,
  ));
}


}

// dart format on
