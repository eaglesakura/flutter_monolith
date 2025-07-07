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

/// fvmコマンドを使用する
 bool get useFvm;/// miseコマンドを使用する
 bool get useMise;/// Dart ワークスペースのルートディレクトリ.
 Directory? get workspace;/// monolith.yamlのリスト.
///
/// 順番に読み込まれ、設定値は上書きされる.
/// 存在しないファイルは無視される.
 List<File> get monolithFiles;
/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonolithOptionsCopyWith<MonolithOptions> get copyWith => _$MonolithOptionsCopyWithImpl<MonolithOptions>(this as MonolithOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonolithOptions&&(identical(other.useFvm, useFvm) || other.useFvm == useFvm)&&(identical(other.useMise, useMise) || other.useMise == useMise)&&(identical(other.workspace, workspace) || other.workspace == workspace)&&const DeepCollectionEquality().equals(other.monolithFiles, monolithFiles));
}


@override
int get hashCode => Object.hash(runtimeType,useFvm,useMise,workspace,const DeepCollectionEquality().hash(monolithFiles));

@override
String toString() {
  return 'MonolithOptions(useFvm: $useFvm, useMise: $useMise, workspace: $workspace, monolithFiles: $monolithFiles)';
}


}

/// @nodoc
abstract mixin class $MonolithOptionsCopyWith<$Res>  {
  factory $MonolithOptionsCopyWith(MonolithOptions value, $Res Function(MonolithOptions) _then) = _$MonolithOptionsCopyWithImpl;
@useResult
$Res call({
 bool useFvm, bool useMise, Directory? workspace, List<File> monolithFiles
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
@pragma('vm:prefer-inline') @override $Res call({Object? useFvm = null,Object? useMise = null,Object? workspace = freezed,Object? monolithFiles = null,}) {
  return _then(_self.copyWith(
useFvm: null == useFvm ? _self.useFvm : useFvm // ignore: cast_nullable_to_non_nullable
as bool,useMise: null == useMise ? _self.useMise : useMise // ignore: cast_nullable_to_non_nullable
as bool,workspace: freezed == workspace ? _self.workspace : workspace // ignore: cast_nullable_to_non_nullable
as Directory?,monolithFiles: null == monolithFiles ? _self.monolithFiles : monolithFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

}


/// @nodoc


class _MonolithOptions implements MonolithOptions {
  const _MonolithOptions({this.useFvm = false, this.useMise = false, this.workspace, required final  List<File> monolithFiles}): _monolithFiles = monolithFiles;
  

/// fvmコマンドを使用する
@override@JsonKey() final  bool useFvm;
/// miseコマンドを使用する
@override@JsonKey() final  bool useMise;
/// Dart ワークスペースのルートディレクトリ.
@override final  Directory? workspace;
/// monolith.yamlのリスト.
///
/// 順番に読み込まれ、設定値は上書きされる.
/// 存在しないファイルは無視される.
 final  List<File> _monolithFiles;
/// monolith.yamlのリスト.
///
/// 順番に読み込まれ、設定値は上書きされる.
/// 存在しないファイルは無視される.
@override List<File> get monolithFiles {
  if (_monolithFiles is EqualUnmodifiableListView) return _monolithFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monolithFiles);
}


/// Create a copy of MonolithOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonolithOptionsCopyWith<_MonolithOptions> get copyWith => __$MonolithOptionsCopyWithImpl<_MonolithOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonolithOptions&&(identical(other.useFvm, useFvm) || other.useFvm == useFvm)&&(identical(other.useMise, useMise) || other.useMise == useMise)&&(identical(other.workspace, workspace) || other.workspace == workspace)&&const DeepCollectionEquality().equals(other._monolithFiles, _monolithFiles));
}


@override
int get hashCode => Object.hash(runtimeType,useFvm,useMise,workspace,const DeepCollectionEquality().hash(_monolithFiles));

@override
String toString() {
  return 'MonolithOptions(useFvm: $useFvm, useMise: $useMise, workspace: $workspace, monolithFiles: $monolithFiles)';
}


}

/// @nodoc
abstract mixin class _$MonolithOptionsCopyWith<$Res> implements $MonolithOptionsCopyWith<$Res> {
  factory _$MonolithOptionsCopyWith(_MonolithOptions value, $Res Function(_MonolithOptions) _then) = __$MonolithOptionsCopyWithImpl;
@override @useResult
$Res call({
 bool useFvm, bool useMise, Directory? workspace, List<File> monolithFiles
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
@override @pragma('vm:prefer-inline') $Res call({Object? useFvm = null,Object? useMise = null,Object? workspace = freezed,Object? monolithFiles = null,}) {
  return _then(_MonolithOptions(
useFvm: null == useFvm ? _self.useFvm : useFvm // ignore: cast_nullable_to_non_nullable
as bool,useMise: null == useMise ? _self.useMise : useMise // ignore: cast_nullable_to_non_nullable
as bool,workspace: freezed == workspace ? _self.workspace : workspace // ignore: cast_nullable_to_non_nullable
as Directory?,monolithFiles: null == monolithFiles ? _self._monolithFiles : monolithFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

// dart format on
