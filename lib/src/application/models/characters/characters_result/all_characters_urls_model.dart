import 'dart:convert';

import 'package:flutter/widgets.dart';

class AllCharactersUrlsModel {
  final String? type;
  final String? url;
  AllCharactersUrlsModel({
    this.type,
    this.url,
  });

  AllCharactersUrlsModel copyWith({
    ValueGetter<String?>? type,
    ValueGetter<String?>? url,
  }) {
    return AllCharactersUrlsModel(
      type: type != null ? type() : this.type,
      url: url != null ? url() : this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'url': url,
    };
  }

  factory AllCharactersUrlsModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersUrlsModel(
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersUrlsModel.fromJson(String source) =>
      AllCharactersUrlsModel.fromMap(json.decode(source));

  @override
  String toString() => 'AllCharactersUrlsModel(type: $type, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersUrlsModel &&
        other.type == type &&
        other.url == url;
  }

  @override
  int get hashCode => type.hashCode ^ url.hashCode;
}
