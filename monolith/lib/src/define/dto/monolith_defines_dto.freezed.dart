// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_defines_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonolithDefinesDto {

@JsonKey(name: 'defines_path') String get definesPath;@JsonKey(name: 'generate') MonolithDefinesGenerateDto get generate;@JsonKey(name: 'flavors') Map<String, Map<String, String>> get flavors;
/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithDefinesDtoCopyWith<MonolithDefinesDto> get copyWith => _$MonolithDefinesDtoCopyWithImpl<MonolithDefinesDto>(this as MonolithDefinesDto, _$identity);

  /// Serializes this MonolithDefinesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithDefinesDto&&(identical(other.definesPath, definesPath) || other.definesPath == definesPath)&&(identical(other.generate, generate) || other.generate == generate)&&const DeepCollectionEquality().equals(other.flavors, flavors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definesPath,generate,const DeepCollectionEquality().hash(flavors));

@override
String toString() {
  return 'MonolithDefinesDto(definesPath: $definesPath, generate: $generate, flavors: $flavors)';
}


}

/// @nodoc
abstract mixin class $MonolithDefinesDtoCopyWith<$Res>  {
  factory $MonolithDefinesDtoCopyWith(MonolithDefinesDto value, $Res Function(MonolithDefinesDto) _then) = _$MonolithDefinesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'defines_path') String definesPath,@JsonKey(name: 'generate') MonolithDefinesGenerateDto generate,@JsonKey(name: 'flavors') Map<String, Map<String, String>> flavors
});


$MonolithDefinesGenerateDtoCopyWith<$Res> get generate;

}
/// @nodoc
class _$MonolithDefinesDtoCopyWithImpl<$Res>
    implements $MonolithDefinesDtoCopyWith<$Res> {
  _$MonolithDefinesDtoCopyWithImpl(this._self, this._then);

  final MonolithDefinesDto _self;
  final $Res Function(MonolithDefinesDto) _then;

/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? definesPath = null,Object? generate = null,Object? flavors = null,}) {
  return _then(_self.copyWith(
definesPath: null == definesPath ? _self.definesPath : definesPath // ignore: cast_nullable_to_non_nullable
as String,generate: null == generate ? _self.generate : generate // ignore: cast_nullable_to_non_nullable
as MonolithDefinesGenerateDto,flavors: null == flavors ? _self.flavors : flavors // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,
  ));
}
/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithDefinesGenerateDtoCopyWith<$Res> get generate {
  
  return $MonolithDefinesGenerateDtoCopyWith<$Res>(_self.generate, (value) {
    return _then(_self.copyWith(generate: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MonolithDefinesDto implements MonolithDefinesDto {
  const _MonolithDefinesDto({@JsonKey(name: 'defines_path') required this.definesPath, @JsonKey(name: 'generate') required this.generate, @JsonKey(name: 'flavors') required final  Map<String, Map<String, String>> flavors}): _flavors = flavors;
  factory _MonolithDefinesDto.fromJson(Map<String, dynamic> json) => _$MonolithDefinesDtoFromJson(json);

@override@JsonKey(name: 'defines_path') final  String definesPath;
@override@JsonKey(name: 'generate') final  MonolithDefinesGenerateDto generate;
 final  Map<String, Map<String, String>> _flavors;
@override@JsonKey(name: 'flavors') Map<String, Map<String, String>> get flavors {
  if (_flavors is EqualUnmodifiableMapView) return _flavors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_flavors);
}


/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithDefinesDtoCopyWith<_MonolithDefinesDto> get copyWith => __$MonolithDefinesDtoCopyWithImpl<_MonolithDefinesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonolithDefinesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithDefinesDto&&(identical(other.definesPath, definesPath) || other.definesPath == definesPath)&&(identical(other.generate, generate) || other.generate == generate)&&const DeepCollectionEquality().equals(other._flavors, _flavors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definesPath,generate,const DeepCollectionEquality().hash(_flavors));

@override
String toString() {
  return 'MonolithDefinesDto(definesPath: $definesPath, generate: $generate, flavors: $flavors)';
}


}

/// @nodoc
abstract mixin class _$MonolithDefinesDtoCopyWith<$Res> implements $MonolithDefinesDtoCopyWith<$Res> {
  factory _$MonolithDefinesDtoCopyWith(_MonolithDefinesDto value, $Res Function(_MonolithDefinesDto) _then) = __$MonolithDefinesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'defines_path') String definesPath,@JsonKey(name: 'generate') MonolithDefinesGenerateDto generate,@JsonKey(name: 'flavors') Map<String, Map<String, String>> flavors
});


@override $MonolithDefinesGenerateDtoCopyWith<$Res> get generate;

}
/// @nodoc
class __$MonolithDefinesDtoCopyWithImpl<$Res>
    implements _$MonolithDefinesDtoCopyWith<$Res> {
  __$MonolithDefinesDtoCopyWithImpl(this._self, this._then);

  final _MonolithDefinesDto _self;
  final $Res Function(_MonolithDefinesDto) _then;

/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? definesPath = null,Object? generate = null,Object? flavors = null,}) {
  return _then(_MonolithDefinesDto(
definesPath: null == definesPath ? _self.definesPath : definesPath // ignore: cast_nullable_to_non_nullable
as String,generate: null == generate ? _self.generate : generate // ignore: cast_nullable_to_non_nullable
as MonolithDefinesGenerateDto,flavors: null == flavors ? _self._flavors : flavors // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,
  ));
}

/// Create a copy of MonolithDefinesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonolithDefinesGenerateDtoCopyWith<$Res> get generate {
  
  return $MonolithDefinesGenerateDtoCopyWith<$Res>(_self.generate, (value) {
    return _then(_self.copyWith(generate: value));
  });
}
}

// dart format on
