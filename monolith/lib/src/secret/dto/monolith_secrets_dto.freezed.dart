// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_secrets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithSecretsDto {

// ignore: invalid_annotation_target
@JsonKey(name: 'secrets') List<MonolithSecretDto>? get secrets;
/// Create a copy of MonolithSecretsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithSecretsDtoCopyWith<MonolithSecretsDto> get copyWith => _$MonolithSecretsDtoCopyWithImpl<MonolithSecretsDto>(this as MonolithSecretsDto, _$identity);

  /// Serializes this MonolithSecretsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithSecretsDto&&const DeepCollectionEquality().equals(other.secrets, secrets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(secrets));

@override
String toString() {
  return 'MonolithSecretsDto(secrets: $secrets)';
}


}

/// @nodoc
abstract mixin class $MonolithSecretsDtoCopyWith<$Res>  {
  factory $MonolithSecretsDtoCopyWith(MonolithSecretsDto value, $Res Function(MonolithSecretsDto) _then) = _$MonolithSecretsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'secrets') List<MonolithSecretDto>? secrets
});




}
/// @nodoc
class _$MonolithSecretsDtoCopyWithImpl<$Res>
    implements $MonolithSecretsDtoCopyWith<$Res> {
  _$MonolithSecretsDtoCopyWithImpl(this._self, this._then);

  final MonolithSecretsDto _self;
  final $Res Function(MonolithSecretsDto) _then;

/// Create a copy of MonolithSecretsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secrets = freezed,}) {
  return _then(_self.copyWith(
secrets: freezed == secrets ? _self.secrets : secrets // ignore: cast_nullable_to_non_nullable
as List<MonolithSecretDto>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MonolithSecretsDto implements MonolithSecretsDto {
  const _MonolithSecretsDto({@JsonKey(name: 'secrets') final  List<MonolithSecretDto>? secrets}): _secrets = secrets;
  factory _MonolithSecretsDto.fromJson(Map<String, dynamic> json) => _$MonolithSecretsDtoFromJson(json);

// ignore: invalid_annotation_target
 final  List<MonolithSecretDto>? _secrets;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'secrets') List<MonolithSecretDto>? get secrets {
  final value = _secrets;
  if (value == null) return null;
  if (_secrets is EqualUnmodifiableListView) return _secrets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MonolithSecretsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithSecretsDtoCopyWith<_MonolithSecretsDto> get copyWith => __$MonolithSecretsDtoCopyWithImpl<_MonolithSecretsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithSecretsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithSecretsDto&&const DeepCollectionEquality().equals(other._secrets, _secrets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_secrets));

@override
String toString() {
  return 'MonolithSecretsDto(secrets: $secrets)';
}


}

/// @nodoc
abstract mixin class _$MonolithSecretsDtoCopyWith<$Res> implements $MonolithSecretsDtoCopyWith<$Res> {
  factory _$MonolithSecretsDtoCopyWith(_MonolithSecretsDto value, $Res Function(_MonolithSecretsDto) _then) = __$MonolithSecretsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'secrets') List<MonolithSecretDto>? secrets
});




}
/// @nodoc
class __$MonolithSecretsDtoCopyWithImpl<$Res>
    implements _$MonolithSecretsDtoCopyWith<$Res> {
  __$MonolithSecretsDtoCopyWithImpl(this._self, this._then);

  final _MonolithSecretsDto _self;
  final $Res Function(_MonolithSecretsDto) _then;

/// Create a copy of MonolithSecretsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secrets = freezed,}) {
  return _then(_MonolithSecretsDto(
secrets: freezed == secrets ? _self._secrets : secrets // ignore: cast_nullable_to_non_nullable
as List<MonolithSecretDto>?,
  ));
}


}

// dart format on
