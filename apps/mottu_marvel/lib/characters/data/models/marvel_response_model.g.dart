// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarvelResponseImpl _$$MarvelResponseImplFromJson(Map<String, dynamic> json) =>
    _$MarvelResponseImpl(
      etag: json['etag'] as String,
      data: MarvelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarvelResponseImplToJson(
        _$MarvelResponseImpl instance) =>
    <String, dynamic>{
      'etag': instance.etag,
      'data': instance.data,
    };

_$MarvelDataImpl _$$MarvelDataImplFromJson(Map<String, dynamic> json) =>
    _$MarvelDataImpl(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MarvelCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MarvelDataImplToJson(_$MarvelDataImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results,
    };

_$MarvelCharacterImpl _$$MarvelCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$MarvelCharacterImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail:
          MarvelThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarvelCharacterImplToJson(
        _$MarvelCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };

_$MarvelThumbnailImpl _$$MarvelThumbnailImplFromJson(
        Map<String, dynamic> json) =>
    _$MarvelThumbnailImpl(
      path: json['path'] as String,
      extension: json['extension'] as String,
    );

Map<String, dynamic> _$$MarvelThumbnailImplToJson(
        _$MarvelThumbnailImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };
