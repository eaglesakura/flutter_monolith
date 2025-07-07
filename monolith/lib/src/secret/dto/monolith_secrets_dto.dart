import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith/src/secret/dto/monolith_secret_dto.dart';

part 'monolith_secrets_dto.freezed.dart';
part 'monolith_secrets_dto.g.dart';

@freezed
abstract class MonolithSecretsDto with _$MonolithSecretsDto {
  const factory MonolithSecretsDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'secrets') List<MonolithSecretDto>? secrets,
  }) = _MonolithSecretsDto;

  factory MonolithSecretsDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithSecretsDtoFromJson(json);
}
