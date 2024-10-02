import 'package:freezed_annotation/freezed_annotation.dart';

part 'marvel_response_model.freezed.dart';
part 'marvel_response_model.g.dart';

@freezed
class MarvelResponse with _$MarvelResponse {
  const factory MarvelResponse({
    required String etag,
    required MarvelData data,
  }) = _MarvelResponse;

  factory MarvelResponse.fromJson(Map<String, dynamic> json) => _$MarvelResponseFromJson(json);
}

@freezed
class MarvelData with _$MarvelData {
  const factory MarvelData({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required List<MarvelCharacter> results,
  }) = _MarvelData;

  factory MarvelData.fromJson(Map<String, dynamic> json) => _$MarvelDataFromJson(json);
}

@freezed
class MarvelCharacter with _$MarvelCharacter {
  const factory MarvelCharacter({
    required int id,
    required String name,
    required String description,
    required MarvelThumbnail thumbnail,
    required MarvelComics comics,
    required MarvelSeries series,
    required MarvelStories stories,
    required MarvelEvents events,
  }) = _MarvelCharacter;

  factory MarvelCharacter.fromJson(Map<String, dynamic> json) => _$MarvelCharacterFromJson(json);
}

@freezed
class MarvelThumbnail with _$MarvelThumbnail {
  const factory MarvelThumbnail({
    required String path,
    required String extension,
  }) = _MarvelThumbnail;

  factory MarvelThumbnail.fromJson(Map<String, dynamic> json) => _$MarvelThumbnailFromJson(json);
}

@freezed
class MarvelComics with _$MarvelComics {
  const factory MarvelComics({
    required int available,
    required String collectionURI,
    required List<MarvelItem> items,
    required int returned,
  }) = _MarvelComics;

  factory MarvelComics.fromJson(Map<String, dynamic> json) => _$MarvelComicsFromJson(json);
}

@freezed
class MarvelItem with _$MarvelItem {
  const factory MarvelItem({
    required String resourceURI,
    required String name,
  }) = _MarvelItem;

  factory MarvelItem.fromJson(Map<String, dynamic> json) => _$MarvelItemFromJson(json);
}

@freezed
class MarvelSeries with _$MarvelSeries {
  const factory MarvelSeries({
    required int available,
    required String collectionURI,
    required List<MarvelItem> items,
    required int returned,
  }) = _MarvelSeries;

  factory MarvelSeries.fromJson(Map<String, dynamic> json) => _$MarvelSeriesFromJson(json);
}

@freezed
class MarvelStories with _$MarvelStories {
  const factory MarvelStories({
    required int available,
    required String collectionURI,
    required List<MarvelStoryItem> items,
    required int returned,
  }) = _MarvelStories;

  factory MarvelStories.fromJson(Map<String, dynamic> json) => _$MarvelStoriesFromJson(json);
}

@freezed
class MarvelStoryItem with _$MarvelStoryItem {
  const factory MarvelStoryItem({
    required String resourceURI,
    required String name,
    required String type,
  }) = _MarvelStoryItem;

  factory MarvelStoryItem.fromJson(Map<String, dynamic> json) => _$MarvelStoryItemFromJson(json);
}

@freezed
class MarvelEvents with _$MarvelEvents {
  const factory MarvelEvents({
    required int available,
    required String collectionURI,
    required List<MarvelItem> items,
    required int returned,
  }) = _MarvelEvents;

  factory MarvelEvents.fromJson(Map<String, dynamic> json) => _$MarvelEventsFromJson(json);
}
