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
      comics: MarvelComics.fromJson(json['comics'] as Map<String, dynamic>),
      series: MarvelSeries.fromJson(json['series'] as Map<String, dynamic>),
      stories: MarvelStories.fromJson(json['stories'] as Map<String, dynamic>),
      events: MarvelEvents.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarvelCharacterImplToJson(
        _$MarvelCharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'comics': instance.comics,
      'series': instance.series,
      'stories': instance.stories,
      'events': instance.events,
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

_$MarvelComicsImpl _$$MarvelComicsImplFromJson(Map<String, dynamic> json) =>
    _$MarvelComicsImpl(
      available: (json['available'] as num).toInt(),
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MarvelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: (json['returned'] as num).toInt(),
    );

Map<String, dynamic> _$$MarvelComicsImplToJson(_$MarvelComicsImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };

_$MarvelItemImpl _$$MarvelItemImplFromJson(Map<String, dynamic> json) =>
    _$MarvelItemImpl(
      resourceURI: json['resourceURI'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$MarvelItemImplToJson(_$MarvelItemImpl instance) =>
    <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
    };

_$MarvelSeriesImpl _$$MarvelSeriesImplFromJson(Map<String, dynamic> json) =>
    _$MarvelSeriesImpl(
      available: (json['available'] as num).toInt(),
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MarvelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: (json['returned'] as num).toInt(),
    );

Map<String, dynamic> _$$MarvelSeriesImplToJson(_$MarvelSeriesImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };

_$MarvelStoriesImpl _$$MarvelStoriesImplFromJson(Map<String, dynamic> json) =>
    _$MarvelStoriesImpl(
      available: (json['available'] as num).toInt(),
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MarvelStoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: (json['returned'] as num).toInt(),
    );

Map<String, dynamic> _$$MarvelStoriesImplToJson(_$MarvelStoriesImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };

_$MarvelStoryItemImpl _$$MarvelStoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$MarvelStoryItemImpl(
      resourceURI: json['resourceURI'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$MarvelStoryItemImplToJson(
        _$MarvelStoryItemImpl instance) =>
    <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
      'type': instance.type,
    };

_$MarvelEventsImpl _$$MarvelEventsImplFromJson(Map<String, dynamic> json) =>
    _$MarvelEventsImpl(
      available: (json['available'] as num).toInt(),
      collectionURI: json['collectionURI'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MarvelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returned: (json['returned'] as num).toInt(),
    );

Map<String, dynamic> _$$MarvelEventsImplToJson(_$MarvelEventsImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items,
      'returned': instance.returned,
    };
