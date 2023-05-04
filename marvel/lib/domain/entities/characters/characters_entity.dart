import 'package:equatable/equatable.dart';
import 'package:marvel/domain/entities/characters/characters.dart';

class CharactersEntity extends Equatable {
  const CharactersEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.modified,
  });

  final int id;
  final ThumbnailEntity image;
  final String name;
  final String description;
  final String modified;

  @override
  List<Object?> get props => [id, image, name, description, modified];

  String imagePath() {
    return '${image.path}/detail.${image.extension}';
  }

  String dateModifiedFormated() {
    final date = modified.split('T').first;
    final dateSplit = date.split('-');

    return '${dateSplit[2]}/${dateSplit[1]}/${dateSplit[0]}';
  }
}
