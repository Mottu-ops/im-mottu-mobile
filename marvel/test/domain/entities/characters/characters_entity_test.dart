import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/domain/domain.dart';

import '../../../mocks/characters_mock.dart';

void main() {
  final CharactersEntity charactersEntity = CharactersMock.charactersEntity;
  const String tDateModifiedFormated = '29/04/2014';
  String tImagePath =
      '${charactersEntity.image.path}/detail.${charactersEntity.image.extension}';
  test('characters entity ...', () async {
    expect(charactersEntity, isA<CharactersEntity>());
  });

  test('should 1', () {
    expect(charactersEntity.imagePath(), tImagePath);
  });

  test('should 2', () {
    expect(charactersEntity.dateModifiedFormated(), tDateModifiedFormated);
  });

  test('should 3', () {
    expect(
      charactersEntity.props,
      [
        charactersEntity.id,
        charactersEntity.image,
        charactersEntity.name,
        charactersEntity.description,
        charactersEntity.modified,
      ],
    );
  });
}
