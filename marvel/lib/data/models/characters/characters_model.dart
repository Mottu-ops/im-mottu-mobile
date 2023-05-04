import 'package:marvel/data/models/characters/characters.dart';
import 'package:marvel/domain/entities/characters/characters.dart';

class CharactersModel extends CharactersEntity {
  const CharactersModel({
    required super.id,
    required super.image,
    required super.name,
    required super.description,
    required super.modified,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'],
      image: ThumbnailModel.fromJson(json['thumbnail']),
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
    );
  }
}
