import 'dart:convert';

import 'package:im_mottu_flutter/app/modules/home/interactor/models/url.dart';

class StoriesItem {
  final String resourceUri;
  final String name;
  final ItemType type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  StoriesItem copyWith({
    String? resourceUri,
    String? name,
    ItemType? type,
  }) =>
      StoriesItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory StoriesItem.fromJson(String str) => StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
      };
}

enum ItemType { COVER, EMPTY, INTERIOR_STORY }

final itemTypeValues =
    EnumValues({"cover": ItemType.COVER, "": ItemType.EMPTY, "interiorStory": ItemType.INTERIOR_STORY});
