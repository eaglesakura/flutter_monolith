import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monolith/src/install/dto/monolith_install_dto.dart';

part 'monolith_installs_dto.freezed.dart';
part 'monolith_installs_dto.g.dart';

@freezed
abstract class MonolithInstallsDto with _$MonolithInstallsDto {
  const factory MonolithInstallsDto({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'install') List<MonolithInstallDto>? installs,
  }) = _MonolithInstallsDto;

  factory MonolithInstallsDto.fromJson(Map<String, dynamic> json) =>
      _$MonolithInstallsDtoFromJson(json);
}
