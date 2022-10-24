import 'dart:convert';

import '../../domain/char_entity.dart';

class CharModel extends Char {
  const CharModel({
    required String name,
    required String description,
    required String imageUrl,
  }) : super(
          description: description,
          imageUrl: imageUrl,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  Char toEntity() {
    return Char(
      description: description,
      imageUrl: imageUrl,
      name: name,
    );
  }

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
