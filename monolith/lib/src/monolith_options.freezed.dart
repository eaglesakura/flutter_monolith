// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monolith_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonolithOptions {

/// monolith.yamlのパス.
/// nullの場合、カレントディレクトリをルートとして `monolith.yaml` を読み込む.
 File? get monolith;/// シェル実行インスタンス.
 ShellRunner? get shellRunner;
/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithOptionsCopyWith<MonolithOptions> get copyWith => _$MonolithOptionsCopyWithImpl<MonolithOptions>(this as MonolithOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithOptions&&(identical(other.monolith, monolith) || other.monolith == monolith)&&(identical(other.shellRunner, shellRunner) || other.shellRunner == shellRunner));
}


@override
int get hashCode => Object.hash(runtimeType,monolith,shellRunner);

@override
String toString() {
  return 'MonolithOptions(monolith: $monolith, shellRunner: $shellRunner)';
}


}

/// @nodoc
abstract mixin class $MonolithOptionsCopyWith<$Res>  {
  factory $MonolithOptionsCopyWith(MonolithOptions value, $Res Function(MonolithOptions) _then) = _$MonolithOptionsCopyWithImpl;
@useResult
$Res call({
 File? monolith, ShellRunner? shellRunner
});




}
/// @nodoc
class _$MonolithOptionsCopyWithImpl<$Res>
    implements $MonolithOptionsCopyWith<$Res> {
  _$MonolithOptionsCopyWithImpl(this._self, this._then);

  final MonolithOptions _self;
  final $Res Function(MonolithOptions) _then;

/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monolith = freezed,Object? shellRunner = freezed,}) {
  return _then(_self.copyWith(
monolith: freezed == monolith ? _self.monolith : monolith // ignore: cast_nullable_to_non_nullable
as File?,shellRunner: freezed == shellRunner ? _self.shellRunner : shellRunner // ignore: cast_nullable_to_non_nullable
as ShellRunner?,
  ));
}

}


/// @nodoc


class _MonolithOptions implements MonolithOptions {
  const _MonolithOptions({this.monolith, this.shellRunner});
  

/// monolith.yamlのパス.
/// nullの場合、カレントディレクトリをルートとして `monolith.yaml` を読み込む.
@override final  File? monolith;
/// シェル実行インスタンス.
@override final  ShellRunner? shellRunner;

/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithOptionsCopyWith<_MonolithOptions> get copyWith => __$MonolithOptionsCopyWithImpl<_MonolithOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithOptions&&(identical(other.monolith, monolith) || other.monolith == monolith)&&(identical(other.shellRunner, shellRunner) || other.shellRunner == shellRunner));
}


@override
int get hashCode => Object.hash(runtimeType,monolith,shellRunner);

@override
String toString() {
  return 'MonolithOptions(monolith: $monolith, shellRunner: $shellRunner)';
}


}

/// @nodoc
abstract mixin class _$MonolithOptionsCopyWith<$Res> implements $MonolithOptionsCopyWith<$Res> {
  factory _$MonolithOptionsCopyWith(_MonolithOptions value, $Res Function(_MonolithOptions) _then) = __$MonolithOptionsCopyWithImpl;
@override @useResult
$Res call({
 File? monolith, ShellRunner? shellRunner
});




}
/// @nodoc
class __$MonolithOptionsCopyWithImpl<$Res>
    implements _$MonolithOptionsCopyWith<$Res> {
  __$MonolithOptionsCopyWithImpl(this._self, this._then);

  final _MonolithOptions _self;
  final $Res Function(_MonolithOptions) _then;

/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monolith = freezed,Object? shellRunner = freezed,}) {
  return _then(_MonolithOptions(
monolith: freezed == monolith ? _self.monolith : monolith // ignore: cast_nullable_to_non_nullable
as File?,shellRunner: freezed == shellRunner ? _self.shellRunner : shellRunner // ignore: cast_nullable_to_non_nullable
as ShellRunner?,
  ));
}


}

// dart format on
