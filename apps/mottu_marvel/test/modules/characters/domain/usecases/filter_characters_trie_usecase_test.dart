import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';

import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_trie_usecase.dart';

class MarvelComicsMock extends Mock implements MarvelComics {}

class MarvelSeriesMock extends Mock implements MarvelSeries {}

class MarvelEventsMock extends Mock implements MarvelEvents {}

void main() {
  final character1 = MarvelCharacter(
    id: 1,
    name: '3-D Man',
    description: '',
    thumbnail: MarvelThumbnail(
      path: 'path',
      extension: 'extension',
    ),
    comics: MarvelComicsMock(),
    series: MarvelSeriesMock(),
    events: MarvelEventsMock(),
  );
  final character2 = MarvelCharacter(
    id: 2,
    name: 'A-Bomb (HAS)',
    description: '',
    thumbnail: MarvelThumbnail(
      path: 'path',
      extension: 'extension',
    ),
    comics: MarvelComicsMock(),
    series: MarvelSeriesMock(),
    events: MarvelEventsMock(),
  );
  final character3 = MarvelCharacter(
    id: 3,
    name: 'Abyss (Age of Apocalypse)',
    description: '',
    thumbnail: MarvelThumbnail(
      path: 'path',
      extension: 'extension',
    ),
    comics: MarvelComicsMock(),
    series: MarvelSeriesMock(),
    events: MarvelEventsMock(),
  );
  final character4 = MarvelCharacter(
    id: 3,
    name: 'Batman',
    description: '',
    thumbnail: MarvelThumbnail(
      path: 'path',
      extension: 'extension',
    ),
    comics: MarvelComicsMock(),
    series: MarvelSeriesMock(),
    events: MarvelEventsMock(),
  );
  final character5 = MarvelCharacter(
    id: 3,
    name: 'Casa',
    description: '',
    thumbnail: MarvelThumbnail(
      path: 'path',
      extension: 'extension',
    ),
    comics: MarvelComicsMock(),
    series: MarvelSeriesMock(),
    events: MarvelEventsMock(),
  );
  final initialList = [character3, character1, character2, character4, character5];
  group('HealthCareSearchFilter', () {
    late FilterCharactersTrieUsecase filterCharactersUsecase;

    setUp(() {
      filterCharactersUsecase = FilterCharactersTrieUsecase(initialList: initialList);
    });

    void expectWordInTrie(String word, FilterCharactersTrieUsecase trieService) {
      var currentTrieLetter = trieService.rootLetter;

      for (int i = 0; i < word.length; i++) {
        final currentLetter = word[i];
        expect(
          currentTrieLetter.children.containsKey(currentLetter),
          true,
          reason: 'The letter $currentLetter must be a key of the previous letter`s trieLetter node for word $word',
        );
        currentTrieLetter = currentTrieLetter.children[currentLetter]!;
      }

      expect(
        currentTrieLetter.isEndOfWord,
        true,
        reason: 'The last letter should be marked as the end of the word $word',
      );
    }

    test(
        'Given a initial characters list, when insert the words to the trie tree, then the word should be in the tree data structure',
        () {
      expectWordInTrie(character1.name, filterCharactersUsecase);
      expectWordInTrie(character2.name, filterCharactersUsecase);
      expectWordInTrie(character3.name, filterCharactersUsecase);
      expectWordInTrie(character4.name, filterCharactersUsecase);
      expectWordInTrie(character5.name, filterCharactersUsecase);
    });

    test(
        'Given a list of characters name a a prefix, when filtering by characters name, it should return the filtered characters',
        () {
      final resultPrefix1 = filterCharactersUsecase(param: 'A');
      final resultPrefix2 = filterCharactersUsecase(param: '3');
      final resultPrefix3 = filterCharactersUsecase(param: 'ali');

      expect(resultPrefix1, containsAll([character2, character3]));
      expect(resultPrefix1, isNot(contains(character5)));
      expect(resultPrefix1, isNot(contains(character4)));
      expect(resultPrefix1, isNot(contains(character1)));
      expect(resultPrefix2, containsAll([character1]));
      expect(resultPrefix3, isEmpty);
    });
  });
}
