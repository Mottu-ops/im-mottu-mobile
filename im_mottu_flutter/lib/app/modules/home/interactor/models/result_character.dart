import 'dart:convert';

import 'comics.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'url.dart';

class ResultCharacter {
  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Comics comics;
  final Comics series;
  final Stories stories;
  final Comics events;
  final List<Url> urls;

  ResultCharacter({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  ResultCharacter copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? modified,
    Thumbnail? thumbnail,
    String? resourceUri,
    Comics? comics,
    Comics? series,
    Stories? stories,
    Comics? events,
    List<Url>? urls,
  }) =>
      ResultCharacter(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        resourceUri: resourceUri ?? this.resourceUri,
        comics: comics ?? this.comics,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        events: events ?? this.events,
        urls: urls ?? this.urls,
      );

  factory ResultCharacter.fromJson(String str) => ResultCharacter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCharacter.fromMap(Map<String, dynamic> json) => ResultCharacter(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: DateTime.tryParse(json["modified"]) ?? DateTime.now(),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromMap(json["comics"]),
        series: Comics.fromMap(json["series"]),
        stories: Stories.fromMap(json["stories"]),
        events: Comics.fromMap(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified.toIso8601String(),
        "thumbnail": thumbnail.toMap(),
        "resourceURI": resourceUri,
        "comics": comics.toMap(),
        "series": series.toMap(),
        "stories": stories.toMap(),
        "events": events.toMap(),
        "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
      };
}
