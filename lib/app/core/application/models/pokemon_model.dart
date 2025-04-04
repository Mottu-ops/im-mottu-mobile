import 'package:pokedex/app/core/application/enums/pokemon_type_enum.dart';

class PokemonModel {
  final int id;
  final int weight;
  final int height;
  final String name;
  final String? imageUrl;
  final String? gifUrl;
  final String? criesUrl;
  final List<PokemonTypeEnum> types;

  PokemonModel({
    required this.id,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.name,
    required this.gifUrl,
    required this.criesUrl,
    required this.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      weight: json['weight'],
      height: json['height'],
      id: json['id'],
      criesUrl: json['cries']?['latest'],
      imageUrl: json['sprites']?['front_default'],
      gifUrl: json['sprites']?['other']?['showdown']?['front_default'],
      types: json['types'] != null
          ? (json['types'] as List)
              .map((type) => PokemonTypeEnum.fromJson(type))
              .toList()
          : [],
    );
  }
}
