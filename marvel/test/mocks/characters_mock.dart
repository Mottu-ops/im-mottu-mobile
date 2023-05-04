import 'package:marvel/data/models/characters/characters.dart';
import 'package:marvel/domain/domain.dart';

class CharactersMock {
  static CharactersModel get charactersModel => const CharactersModel(
        id: 1011334,
        image: ThumbnailModel(
          path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
          extension: 'jpg',
        ),
        name: '3-D Man',
        description: '',
        modified: '2014-04-29T14:18:17-0400',
      );

  static CharactersEntity get charactersEntity => CharactersEntity(
        id: charactersModel.id,
        image: ThumbnailModel(
          path: charactersModel.image.path,
          extension: charactersModel.image.extension,
        ),
        name: charactersModel.name,
        description: charactersModel.description,
        modified: charactersModel.modified,
      );
}
