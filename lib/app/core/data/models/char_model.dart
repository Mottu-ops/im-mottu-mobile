import '../../domain/entities/char_entity.dart';

class CharModel extends Char {
  const CharModel({
    required String name,
    required String description,
    required String imageUrl,
    List<Char>? relatedHeroes,
  }) : super(
          description: description,
          imageUrl: imageUrl,
          name: name,
          relatedHeroes: relatedHeroes,
        );

  Char toEntity() {
    return Char(
      description: description,
      imageUrl: imageUrl,
      name: name,
      relatedHeroes: relatedHeroes,
    );
  }

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      name: map['name'],
      description: map['description'],
      imageUrl: map['thumbnail']['path'] + '.' + map['thumbnail']['extension'],
      relatedHeroes: map['relatedHeroes'],
    );
  }
}
