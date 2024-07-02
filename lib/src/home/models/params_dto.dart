import 'package:freezed_annotation/freezed_annotation.dart';

part 'params_dto.freezed.dart';
part 'params_dto.g.dart';

@freezed
abstract class ParamsDto with _$ParamsDto {
  factory ParamsDto({
    @Default(10) int? limit,
    @Default(0) int? offset,
    @Default('') String? nameStartsWith,
  }) = _ParamsDto;
  factory ParamsDto.fromJson(Map<String, dynamic> json) => _$ParamsDtoFromJson(json);
}
