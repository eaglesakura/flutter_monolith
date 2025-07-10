// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_runner_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonolithRunnerArguments {

/// Monolith インスタンス.
 Monolith get monolith;/// --verbose
 bool get verbose;
/// Create a copy of MonolithRunnerArguments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithRunnerArgumentsCopyWith<MonolithRunnerArguments> get copyWith => _$MonolithRunnerArgumentsCopyWithImpl<MonolithRunnerArguments>(this as MonolithRunnerArguments, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithRunnerArguments&&(identical(other.monolith, monolith) || other.monolith == monolith)&&(identical(other.verbose, verbose) || other.verbose == verbose));
}


@override
int get hashCode => Object.hash(runtimeType,monolith,verbose);

@override
String toString() {
  return 'MonolithRunnerArguments(monolith: $monolith, verbose: $verbose)';
}


}

/// @nodoc
abstract mixin class $MonolithRunnerArgumentsCopyWith<$Res>  {
  factory $MonolithRunnerArgumentsCopyWith(MonolithRunnerArguments value, $Res Function(MonolithRunnerArguments) _then) = _$MonolithRunnerArgumentsCopyWithImpl;
@useResult
$Res call({
 Monolith monolith, bool verbose
});




}
/// @nodoc
class _$MonolithRunnerArgumentsCopyWithImpl<$Res>
    implements $MonolithRunnerArgumentsCopyWith<$Res> {
  _$MonolithRunnerArgumentsCopyWithImpl(this._self, this._then);

  final MonolithRunnerArguments _self;
  final $Res Function(MonolithRunnerArguments) _then;

/// Create a copy of MonolithRunnerArguments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monolith = null,Object? verbose = null,}) {
  return _then(_self.copyWith(
monolith: null == monolith ? _self.monolith : monolith // ignore: cast_nullable_to_non_nullable
as Monolith,verbose: null == verbose ? _self.verbose : verbose // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MonolithRunnerArguments implements MonolithRunnerArguments {
   _MonolithRunnerArguments({required this.monolith, this.verbose = false});
  

/// Monolith インスタンス.
@override final  Monolith monolith;
/// --verbose
@override@JsonKey() final  bool verbose;

/// Create a copy of MonolithRunnerArguments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithRunnerArgumentsCopyWith<_MonolithRunnerArguments> get copyWith => __$MonolithRunnerArgumentsCopyWithImpl<_MonolithRunnerArguments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithRunnerArguments&&(identical(other.monolith, monolith) || other.monolith == monolith)&&(identical(other.verbose, verbose) || other.verbose == verbose));
}


@override
int get hashCode => Object.hash(runtimeType,monolith,verbose);

@override
String toString() {
  return 'MonolithRunnerArguments(monolith: $monolith, verbose: $verbose)';
}


}

/// @nodoc
abstract mixin class _$MonolithRunnerArgumentsCopyWith<$Res> implements $MonolithRunnerArgumentsCopyWith<$Res> {
  factory _$MonolithRunnerArgumentsCopyWith(_MonolithRunnerArguments value, $Res Function(_MonolithRunnerArguments) _then) = __$MonolithRunnerArgumentsCopyWithImpl;
@override @useResult
$Res call({
 Monolith monolith, bool verbose
});




}
/// @nodoc
class __$MonolithRunnerArgumentsCopyWithImpl<$Res>
    implements _$MonolithRunnerArgumentsCopyWith<$Res> {
  __$MonolithRunnerArgumentsCopyWithImpl(this._self, this._then);

  final _MonolithRunnerArguments _self;
  final $Res Function(_MonolithRunnerArguments) _then;

/// Create a copy of MonolithRunnerArguments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monolith = null,Object? verbose = null,}) {
  return _then(_MonolithRunnerArguments(
monolith: null == monolith ? _self.monolith : monolith // ignore: cast_nullable_to_non_nullable
as Monolith,verbose: null == verbose ? _self.verbose : verbose // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
