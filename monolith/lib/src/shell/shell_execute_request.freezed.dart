// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shell_execute_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShellExecuteRequest {

/// 実行するコマンド.
 String get command;/// 実行するコマンドの引数.
 List<String> get arguments;/// 実行するコマンドの環境変数.
 Map<String, String>? get environment;/// 実行するコマンドのワーキングディレクトリ.
 Directory? get workingDirectory;/// コマンドが0以外を返却した場合のハンドラ.
 FailMode get failMode;
/// Create a copy of ShellExecuteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellExecuteRequestCopyWith<ShellExecuteRequest> get copyWith => _$ShellExecuteRequestCopyWithImpl<ShellExecuteRequest>(this as ShellExecuteRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellExecuteRequest&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other.arguments, arguments)&&const DeepCollectionEquality().equals(other.environment, environment)&&(identical(other.workingDirectory, workingDirectory) || other.workingDirectory == workingDirectory)&&(identical(other.failMode, failMode) || other.failMode == failMode));
}


@override
int get hashCode => Object.hash(runtimeType,command,const DeepCollectionEquality().hash(arguments),const DeepCollectionEquality().hash(environment),workingDirectory,failMode);

@override
String toString() {
  return 'ShellExecuteRequest(command: $command, arguments: $arguments, environment: $environment, workingDirectory: $workingDirectory, failMode: $failMode)';
}


}

/// @nodoc
abstract mixin class $ShellExecuteRequestCopyWith<$Res>  {
  factory $ShellExecuteRequestCopyWith(ShellExecuteRequest value, $Res Function(ShellExecuteRequest) _then) = _$ShellExecuteRequestCopyWithImpl;
@useResult
$Res call({
 String command, List<String> arguments, Map<String, String>? environment, Directory? workingDirectory, FailMode failMode
});




}
/// @nodoc
class _$ShellExecuteRequestCopyWithImpl<$Res>
    implements $ShellExecuteRequestCopyWith<$Res> {
  _$ShellExecuteRequestCopyWithImpl(this._self, this._then);

  final ShellExecuteRequest _self;
  final $Res Function(ShellExecuteRequest) _then;

/// Create a copy of ShellExecuteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? command = null,Object? arguments = null,Object? environment = freezed,Object? workingDirectory = freezed,Object? failMode = null,}) {
  return _then(_self.copyWith(
command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>,environment: freezed == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,workingDirectory: freezed == workingDirectory ? _self.workingDirectory : workingDirectory // ignore: cast_nullable_to_non_nullable
as Directory?,failMode: null == failMode ? _self.failMode : failMode // ignore: cast_nullable_to_non_nullable
as FailMode,
  ));
}

}


/// @nodoc


class _ShellExecuteRequest implements ShellExecuteRequest {
  const _ShellExecuteRequest({required this.command, required final  List<String> arguments, final  Map<String, String>? environment, this.workingDirectory, this.failMode = FailMode.exit}): _arguments = arguments,_environment = environment;
  

/// 実行するコマンド.
@override final  String command;
/// 実行するコマンドの引数.
 final  List<String> _arguments;
/// 実行するコマンドの引数.
@override List<String> get arguments {
  if (_arguments is EqualUnmodifiableListView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_arguments);
}

/// 実行するコマンドの環境変数.
 final  Map<String, String>? _environment;
/// 実行するコマンドの環境変数.
@override Map<String, String>? get environment {
  final value = _environment;
  if (value == null) return null;
  if (_environment is EqualUnmodifiableMapView) return _environment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// 実行するコマンドのワーキングディレクトリ.
@override final  Directory? workingDirectory;
/// コマンドが0以外を返却した場合のハンドラ.
@override@JsonKey() final  FailMode failMode;

/// Create a copy of ShellExecuteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShellExecuteRequestCopyWith<_ShellExecuteRequest> get copyWith => __$ShellExecuteRequestCopyWithImpl<_ShellExecuteRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShellExecuteRequest&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other._arguments, _arguments)&&const DeepCollectionEquality().equals(other._environment, _environment)&&(identical(other.workingDirectory, workingDirectory) || other.workingDirectory == workingDirectory)&&(identical(other.failMode, failMode) || other.failMode == failMode));
}


@override
int get hashCode => Object.hash(runtimeType,command,const DeepCollectionEquality().hash(_arguments),const DeepCollectionEquality().hash(_environment),workingDirectory,failMode);

@override
String toString() {
  return 'ShellExecuteRequest(command: $command, arguments: $arguments, environment: $environment, workingDirectory: $workingDirectory, failMode: $failMode)';
}


}

/// @nodoc
abstract mixin class _$ShellExecuteRequestCopyWith<$Res> implements $ShellExecuteRequestCopyWith<$Res> {
  factory _$ShellExecuteRequestCopyWith(_ShellExecuteRequest value, $Res Function(_ShellExecuteRequest) _then) = __$ShellExecuteRequestCopyWithImpl;
@override @useResult
$Res call({
 String command, List<String> arguments, Map<String, String>? environment, Directory? workingDirectory, FailMode failMode
});




}
/// @nodoc
class __$ShellExecuteRequestCopyWithImpl<$Res>
    implements _$ShellExecuteRequestCopyWith<$Res> {
  __$ShellExecuteRequestCopyWithImpl(this._self, this._then);

  final _ShellExecuteRequest _self;
  final $Res Function(_ShellExecuteRequest) _then;

/// Create a copy of ShellExecuteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? command = null,Object? arguments = null,Object? environment = freezed,Object? workingDirectory = freezed,Object? failMode = null,}) {
  return _then(_ShellExecuteRequest(
command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>,environment: freezed == environment ? _self._environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,workingDirectory: freezed == workingDirectory ? _self.workingDirectory : workingDirectory // ignore: cast_nullable_to_non_nullable
as Directory?,failMode: null == failMode ? _self.failMode : failMode // ignore: cast_nullable_to_non_nullable
as FailMode,
  ));
}


}

// dart format on
