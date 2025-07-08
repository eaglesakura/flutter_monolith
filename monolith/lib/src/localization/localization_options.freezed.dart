// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizationOptions {

/// ビルド対象のアプリパッケージ
 DartPackage get appPackage;/// 分散されたモジュールパッケージ.
///
/// [appPackage] + [modules] に含まれるstrings.csvをマージし、
/// ローカライゼーションファイルを生成する.
 List<DartPackage> get modules;/// ローカライゼーションテキストを生成するファクトリ.
/// nullの場合はデフォルトのファクトリを使用する.
 LocalizedTextFactory? get localizedTextFactory;
/// Create a copy of LocalizationOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationOptionsCopyWith<LocalizationOptions> get copyWith => _$LocalizationOptionsCopyWithImpl<LocalizationOptions>(this as LocalizationOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationOptions&&(identical(other.appPackage, appPackage) || other.appPackage == appPackage)&&const DeepCollectionEquality().equals(other.modules, modules)&&(identical(other.localizedTextFactory, localizedTextFactory) || other.localizedTextFactory == localizedTextFactory));
}


@override
int get hashCode => Object.hash(runtimeType,appPackage,const DeepCollectionEquality().hash(modules),localizedTextFactory);

@override
String toString() {
  return 'LocalizationOptions(appPackage: $appPackage, modules: $modules, localizedTextFactory: $localizedTextFactory)';
}


}

/// @nodoc
abstract mixin class $LocalizationOptionsCopyWith<$Res>  {
  factory $LocalizationOptionsCopyWith(LocalizationOptions value, $Res Function(LocalizationOptions) _then) = _$LocalizationOptionsCopyWithImpl;
@useResult
$Res call({
 DartPackage appPackage, List<DartPackage> modules, LocalizedTextFactory? localizedTextFactory
});




}
/// @nodoc
class _$LocalizationOptionsCopyWithImpl<$Res>
    implements $LocalizationOptionsCopyWith<$Res> {
  _$LocalizationOptionsCopyWithImpl(this._self, this._then);

  final LocalizationOptions _self;
  final $Res Function(LocalizationOptions) _then;

/// Create a copy of LocalizationOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appPackage = null,Object? modules = null,Object? localizedTextFactory = freezed,}) {
  return _then(_self.copyWith(
appPackage: null == appPackage ? _self.appPackage : appPackage // ignore: cast_nullable_to_non_nullable
as DartPackage,modules: null == modules ? _self.modules : modules // ignore: cast_nullable_to_non_nullable
as List<DartPackage>,localizedTextFactory: freezed == localizedTextFactory ? _self.localizedTextFactory : localizedTextFactory // ignore: cast_nullable_to_non_nullable
as LocalizedTextFactory?,
  ));
}

}


/// @nodoc


class _LocalizationOptions implements LocalizationOptions {
  const _LocalizationOptions({required this.appPackage, required final  List<DartPackage> modules, this.localizedTextFactory}): _modules = modules;
  

/// ビルド対象のアプリパッケージ
@override final  DartPackage appPackage;
/// 分散されたモジュールパッケージ.
///
/// [appPackage] + [modules] に含まれるstrings.csvをマージし、
/// ローカライゼーションファイルを生成する.
 final  List<DartPackage> _modules;
/// 分散されたモジュールパッケージ.
///
/// [appPackage] + [modules] に含まれるstrings.csvをマージし、
/// ローカライゼーションファイルを生成する.
@override List<DartPackage> get modules {
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modules);
}

/// ローカライゼーションテキストを生成するファクトリ.
/// nullの場合はデフォルトのファクトリを使用する.
@override final  LocalizedTextFactory? localizedTextFactory;

/// Create a copy of LocalizationOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationOptionsCopyWith<_LocalizationOptions> get copyWith => __$LocalizationOptionsCopyWithImpl<_LocalizationOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationOptions&&(identical(other.appPackage, appPackage) || other.appPackage == appPackage)&&const DeepCollectionEquality().equals(other._modules, _modules)&&(identical(other.localizedTextFactory, localizedTextFactory) || other.localizedTextFactory == localizedTextFactory));
}


@override
int get hashCode => Object.hash(runtimeType,appPackage,const DeepCollectionEquality().hash(_modules),localizedTextFactory);

@override
String toString() {
  return 'LocalizationOptions(appPackage: $appPackage, modules: $modules, localizedTextFactory: $localizedTextFactory)';
}


}

/// @nodoc
abstract mixin class _$LocalizationOptionsCopyWith<$Res> implements $LocalizationOptionsCopyWith<$Res> {
  factory _$LocalizationOptionsCopyWith(_LocalizationOptions value, $Res Function(_LocalizationOptions) _then) = __$LocalizationOptionsCopyWithImpl;
@override @useResult
$Res call({
 DartPackage appPackage, List<DartPackage> modules, LocalizedTextFactory? localizedTextFactory
});




}
/// @nodoc
class __$LocalizationOptionsCopyWithImpl<$Res>
    implements _$LocalizationOptionsCopyWith<$Res> {
  __$LocalizationOptionsCopyWithImpl(this._self, this._then);

  final _LocalizationOptions _self;
  final $Res Function(_LocalizationOptions) _then;

/// Create a copy of LocalizationOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appPackage = null,Object? modules = null,Object? localizedTextFactory = freezed,}) {
  return _then(_LocalizationOptions(
appPackage: null == appPackage ? _self.appPackage : appPackage // ignore: cast_nullable_to_non_nullable
as DartPackage,modules: null == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<DartPackage>,localizedTextFactory: freezed == localizedTextFactory ? _self.localizedTextFactory : localizedTextFactory // ignore: cast_nullable_to_non_nullable
as LocalizedTextFactory?,
  ));
}


}

// dart format on
