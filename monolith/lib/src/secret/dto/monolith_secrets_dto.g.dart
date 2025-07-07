// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monolith_secrets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonolithSecretsDto _$MonolithSecretsDtoFromJson(Map<String, dynamic> json) =>
    _MonolithSecretsDto(
      secrets: (json['secrets'] as List<dynamic>?)
          ?.map((e) => MonolithSecretDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MonolithSecretsDtoToJson(_MonolithSecretsDto instance) =>
    <String, dynamic>{'secrets': instance.secrets};
