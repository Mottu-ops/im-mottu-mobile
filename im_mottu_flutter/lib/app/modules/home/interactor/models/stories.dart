import 'dart:convert';

import 'stories_item.dart';

class Stories {
    final int available;
    final String collectionUri;
    final List<StoriesItem> items;
    final int returned;

    Stories({
        required this.available,
        required this.collectionUri,
        required this.items,
        required this.returned,
    });

    Stories copyWith({
        int? available,
        String? collectionUri,
        List<StoriesItem>? items,
        int? returned,
    }) => 
        Stories(
            available: available ?? this.available,
            collectionUri: collectionUri ?? this.collectionUri,
            items: items ?? this.items,
            returned: returned ?? this.returned,
        );

    factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
    };
}