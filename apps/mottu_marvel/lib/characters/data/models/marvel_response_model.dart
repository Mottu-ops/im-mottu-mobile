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
