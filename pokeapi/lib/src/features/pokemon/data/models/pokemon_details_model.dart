import 'package:pokeapi/src/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonDetailsModel {
  final int id;
  final String name;
  final double weight;
  final double height;
  final String imageUrl;

  const PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.imageUrl,
  });

  factory PokemonDetailsModel.fromMap(Map<String, dynamic> map) {
    return PokemonDetailsModel(
      id: map['id'],
      name: map['name'],
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
      imageUrl: map['sprites']['front_default'],
    );
  }

  PokemonEntity toPokemonEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      weight: weight,
      height: height,
      imageUrl: imageUrl,
    );
  }
}
