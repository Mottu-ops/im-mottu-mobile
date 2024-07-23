import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_items_model.dart';

class AllCharactersComicsModel {
  final int? available;
  final String? collectionURI;
  final List<Items>? items;
  AllCharactersComicsModel({
    this.available,
    this.collectionURI,
    this.items,
  });

  AllCharactersComicsModel copyWith({
    ValueGetter<int?>? available,
    ValueGetter<String?>? collectionURI,
    ValueGetter<List<Items>?>? items,
  }) {
    return AllCharactersComicsModel(
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

  factory AllCharactersComicsModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersComicsModel(
      available: map['available']?.toInt(),
      collectionURI: map['collectionURI'],
      items: map['items'] != null
          ? List<Items>.from(map['items']?.map((x) => Items.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersComicsModel.fromJson(String source) =>
      AllCharactersComicsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AllCharactersComicsModel(available: $available, collectionURI: $collectionURI, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersComicsModel &&
        other.available == available &&
        other.collectionURI == collectionURI &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode =>
      available.hashCode ^ collectionURI.hashCode ^ items.hashCode;
}
