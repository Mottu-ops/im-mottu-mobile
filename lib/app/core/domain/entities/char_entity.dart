import 'package:equatable/equatable.dart';

class Char extends Equatable {
  final String name;
  final String description;
  final String imageUrl;
  final List<Char>? relatedHeroes;

  const Char({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.relatedHeroes,
  });

  Char copyWith({
    String? name,
    String? description,
    String? imageUrl,
    List<Char>? relatedHeroes,
  }) {
    return Char(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      relatedHeroes: relatedHeroes ?? this.relatedHeroes,
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        imageUrl,
        relatedHeroes,
      ];
}
