import 'package:marvel/domain/entities/characters/characters.dart';

class ThumbnailModel extends ThumbnailEntity {
  const ThumbnailModel({
    required super.path,
    required super.extension,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) {
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension'],
    );
  }
}
