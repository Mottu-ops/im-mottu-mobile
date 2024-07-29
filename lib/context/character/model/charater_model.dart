// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CharacterModel {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    final parts = thumbnail.split('.');
    final extension = parts.removeLast();
    final path = parts.join('.');
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': {
        'path': path,
        'extension': extension,
      },
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}