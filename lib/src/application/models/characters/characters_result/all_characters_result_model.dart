import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_comics_model.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_events_model.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_series_model.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_stories_model.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_urls_model.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_thumbnail/all_characters_thumbnail_model.dart';

class AllCharactersResultModel {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final AllCharactersThumbnailModel? thumbnail;
  final String? resourceURI;
  final AllCharactersComicsModel? comics;
  final AllCharactersSeriesModel? series;
  final AllCharactersStoriesModel? stories;
  final AllCharactersEventsModel? events;
  final List<AllCharactersUrlsModel>? urls;
  AllCharactersResultModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  AllCharactersResultModel copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? description,
    ValueGetter<String?>? modified,
    ValueGetter<AllCharactersThumbnailModel?>? thumbnail,
    ValueGetter<String?>? resourceURI,
    ValueGetter<AllCharactersComicsModel?>? comics,
    ValueGetter<AllCharactersSeriesModel?>? series,
    ValueGetter<AllCharactersStoriesModel?>? stories,
    ValueGetter<AllCharactersEventsModel?>? events,
    ValueGetter<List<AllCharactersUrlsModel>?>? urls,
  }) {
    return AllCharactersResultModel(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      description: description != null ? description() : this.description,
      modified: modified != null ? modified() : this.modified,
      thumbnail: thumbnail != null ? thumbnail() : this.thumbnail,
      resourceURI: resourceURI != null ? resourceURI() : this.resourceURI,
      comics: comics != null ? comics() : this.comics,
      series: series != null ? series() : this.series,
      stories: stories != null ? stories() : this.stories,
      events: events != null ? events() : this.events,
      urls: urls != null ? urls() : this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail?.toMap(),
      'resourceURI': resourceURI,
      'comics': comics?.toMap(),
      'series': series?.toMap(),
      'stories': stories?.toMap(),
      'events': events?.toMap(),
      'urls': urls?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCharactersResultModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersResultModel(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      modified: map['modified'],
      thumbnail: map['thumbnail'] != null
          ? AllCharactersThumbnailModel.fromMap(map['thumbnail'])
          : null,
      resourceURI: map['resourceURI'],
      comics: map['comics'] != null
          ? AllCharactersComicsModel.fromMap(map['comics'])
          : null,
      series: map['series'] != null
          ? AllCharactersSeriesModel.fromMap(map['series'])
          : null,
      stories: map['stories'] != null
          ? AllCharactersStoriesModel.fromMap(map['stories'])
          : null,
      events: map['events'] != null
          ? AllCharactersEventsModel.fromMap(map['events'])
          : null,
      urls: map['urls'] != null
          ? List<AllCharactersUrlsModel>.from(
              map['urls']?.map((x) => AllCharactersUrlsModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersResultModel.fromJson(String source) =>
      AllCharactersResultModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllCharactersResultModel(id: $id, name: $name, description: $description, modified: $modified, thumbnail: $thumbnail, resourceURI: $resourceURI, comics: $comics, series: $series, stories: $stories, events: $events, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersResultModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.modified == modified &&
        other.thumbnail == thumbnail &&
        other.resourceURI == resourceURI &&
        other.comics == comics &&
        other.series == series &&
        other.stories == stories &&
        other.events == events &&
        listEquals(other.urls, urls);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        modified.hashCode ^
        thumbnail.hashCode ^
        resourceURI.hashCode ^
        comics.hashCode ^
        series.hashCode ^
        stories.hashCode ^
        events.hashCode ^
        urls.hashCode;
  }
}
