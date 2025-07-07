// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

// ignore: invalid_annotation_target
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


/// @nodoc
@JsonSerializable()

class _MonolithInstallsDto implements MonolithInstallsDto {
  const _MonolithInstallsDto({@JsonKey(name: 'install') final  List<MonolithInstallDto>? installs}): _installs = installs;
  factory _MonolithInstallsDto.fromJson(Map<String, dynamic> json) => _$MonolithInstallsDtoFromJson(json);

// ignore: invalid_annotation_target
 final  List<MonolithInstallDto>? _installs;
// ignore: invalid_annotation_target
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
