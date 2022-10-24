import 'package:equatable/equatable.dart';

class Char extends Equatable {
  final String name;
  final String description;
  final String imageUrl;
  const Char({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  @override
  //
  List<Object> get props => [name, description, imageUrl];

  Char copyWith({
    String? name,
    String? description,
    String? imageUrl,
  }) {
    return Char(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
