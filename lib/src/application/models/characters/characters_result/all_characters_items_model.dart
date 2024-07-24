import 'dart:convert';

import 'package:flutter/material.dart';

class Items {
  final String? resourceURI;
  final String? name;
  Items({
    this.resourceURI,
    this.name,
  });

  Items copyWith({
    ValueGetter<String?>? resourceURI,
    ValueGetter<String?>? name,
  }) {
    return Items(
      resourceURI: resourceURI != null ? resourceURI() : this.resourceURI,
      name: name != null ? name() : this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() => 'Items(resourceURI: $resourceURI, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items &&
        other.resourceURI == resourceURI &&
        other.name == name;
  }

  @override
  int get hashCode => resourceURI.hashCode ^ name.hashCode;
}
