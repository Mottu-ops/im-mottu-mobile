import 'dart:convert';

import 'package:flutter/widgets.dart';

class AllCharactersThumbnailModel {
  final String? path;
  final String? extension;
  AllCharactersThumbnailModel({
    this.path,
    this.extension,
  });

  AllCharactersThumbnailModel copyWith({
    ValueGetter<String?>? path,
    ValueGetter<String?>? extension,
  }) {
    return AllCharactersThumbnailModel(
      path: path != null ? path() : this.path,
      extension: extension != null ? extension() : this.extension,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'extension': extension,
    };
  }

  factory AllCharactersThumbnailModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersThumbnailModel(
      path: map['path'],
      extension: map['extension'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersThumbnailModel.fromJson(String source) =>
      AllCharactersThumbnailModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AllCharactersThumbnailModel(path: $path, extension: $extension)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersThumbnailModel &&
        other.path == path &&
        other.extension == extension;
  }

  @override
  int get hashCode => path.hashCode ^ extension.hashCode;
}
