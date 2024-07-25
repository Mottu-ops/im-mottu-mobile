import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_items_model.dart';

class AllCharactersStoriesModel {
  final int? available;
  final String? collectionURI;
  final List<Items>? items;
  AllCharactersStoriesModel({
    this.available,
    this.collectionURI,
    this.items,
  });

  AllCharactersStoriesModel copyWith({
    ValueGetter<int?>? available,
    ValueGetter<String?>? collectionURI,
    ValueGetter<List<Items>?>? items,
  }) {
    return AllCharactersStoriesModel(
      available: available != null ? available() : this.available,
      collectionURI:
          collectionURI != null ? collectionURI() : this.collectionURI,
      items: items != null ? items() : this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCharactersStoriesModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersStoriesModel(
      available: map['available']?.toInt(),
      collectionURI: map['collectionURI'],
      items: map['items'] != null
          ? List<Items>.from(map['items']?.map((x) => Items.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersStoriesModel.fromJson(String source) =>
      AllCharactersStoriesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AllCharactersStoriesModel(available: $available, collectionURI: $collectionURI, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersStoriesModel &&
        other.available == available &&
        other.collectionURI == collectionURI &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode =>
      available.hashCode ^ collectionURI.hashCode ^ items.hashCode;
}
