import 'dart:convert';

import 'url.dart';

class Thumbnail {
  final String path;
  final Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  Thumbnail copyWith({
    String? path,
    Extension? extension,
  }) =>
      Thumbnail(
        path: path ?? this.path,
        extension: extension ?? this.extension,
      );

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: extensionValues.map[json["extension"]]!,
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extensionValues.reverse[extension],
      };
}

enum Extension { GIF, JPG }

final extensionValues = EnumValues({"gif": Extension.GIF, "jpg": Extension.JPG});
