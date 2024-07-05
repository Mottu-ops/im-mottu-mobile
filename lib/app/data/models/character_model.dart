import 'package:equatable/equatable.dart';
import 'package:mottu_marvel/app/data/models/comic_model.dart';
import 'package:mottu_marvel/app/data/models/thumbnail_model.dart';
import 'package:mottu_marvel/app/domain/entities/character_entity.dart';

class CharacterModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final ThumbnailModel? thumbnail;
  final String? resourceURI;
  final ComicModel? series;
  final ComicModel? events;

  const CharacterModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.series,
    this.events,
  });

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name,
        description: description,
        modified: modified,
        thumbnail: thumbnail?.toEntity(),
        resourceURI: resourceURI,
        series: series?.toEntity(),
        events: events?.toEntity(),
      );

  CharacterModel fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: json['thumbnail'] != null
          ? const ThumbnailModel().fromJson(json['thumbnail'])
          : null,
      resourceURI: json['resourceURI'],
      series: json['series'] != null
          ? const ComicModel().fromJson(json['series'])
          : null,
      events: json['events'] != null
          ? const ComicModel().fromJson(json['events'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;

    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }

    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        thumbnail,
        resourceURI,
        series,
        events,
      ];
}
