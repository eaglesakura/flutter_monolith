// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_installs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithInstallsDto _$MonolithInstallsDtoFromJson(Map<String, dynamic> json) =>
    _MonolithInstallsDto(
      installs: (json['install'] as List<dynamic>?)
          ?.map((e) => MonolithInstallDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MonolithInstallsDtoToJson(
  _MonolithInstallsDto instance,
) => <String, dynamic>{'install': instance.installs};
