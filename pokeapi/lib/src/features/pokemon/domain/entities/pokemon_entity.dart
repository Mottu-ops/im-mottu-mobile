import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double weight;
  final double height;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, weight, height];
}
