// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParamsDtoImpl _$$ParamsDtoImplFromJson(Map<String, dynamic> json) =>
    _$ParamsDtoImpl(
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      nameStartsWith: json['nameStartsWith'] as String? ?? '',
    );

Map<String, dynamic> _$$ParamsDtoImplToJson(_$ParamsDtoImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'nameStartsWith': instance.nameStartsWith,
    };
