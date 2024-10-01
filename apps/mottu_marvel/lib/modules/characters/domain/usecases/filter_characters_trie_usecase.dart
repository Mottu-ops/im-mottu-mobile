import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

class _TrieLetter {
  Map<String, _TrieLetter> children = {};
  List<MarvelCharacter> characters = [];
  bool isEndOfWord = false;

  _TrieLetter();
}

class FilterCharactersTrieUsecase extends FilterCharactersUsecase {
  FilterCharactersTrieUsecase({required this.initialList}) : rootLetter = _TrieLetter() {
    _insertMarvelCharacters(initialList);
  }

  final _TrieLetter rootLetter;
  final List<MarvelCharacter> initialList;

  @override
  List<MarvelCharacter> call({String? param}) {
    if (param == null) {
      return <MarvelCharacter>[];
    }

    return _searchCharactersByPrefixNames(param);
  }

  void _insertMarvelCharacters(List<MarvelCharacter> characters) {
    for (var eachCharacters in characters) {
      insertCharactersName(eachCharacters);
    }
  }

  void insertCharactersName(MarvelCharacter character) {
    _TrieLetter currentNodeLetter = rootLetter;
    final name = character.name;

    for (int i = 0; i < name.length; i++) {
      final currentWordLetter = name[i];
      if (!currentNodeLetter.children.containsKey(currentWordLetter)) {
        currentNodeLetter.children[currentWordLetter] = _TrieLetter();
      }

      currentNodeLetter = currentNodeLetter.children[currentWordLetter]!;
    }

    currentNodeLetter.isEndOfWord = true;
    currentNodeLetter.characters.add(character);
  }

  List<MarvelCharacter> _searchCharactersByPrefixNames(String characterPrefixName) {
    print('Filtering with Trie strategy');
    final node = _findCharacterPrefixNode(characterPrefixName);

    if (node case final currentNodeLetter?) {
      return _searchCharactersByFoundPrefix(currentNodeLetter, characterPrefixName);
    }

    return [];
  }

  _TrieLetter? _findCharacterPrefixNode(String characterPrefixName) {
    var currentNodeLetter = rootLetter;

    for (int i = 0; i < characterPrefixName.length; i++) {
      final currentLetterInPrefix = characterPrefixName[i];
      if (!currentNodeLetter.children.containsKey(currentLetterInPrefix)) {
        return null;
      }

      currentNodeLetter = currentNodeLetter.children[currentLetterInPrefix]!;
    }

    return currentNodeLetter;
  }

  List<MarvelCharacter> _searchCharactersByFoundPrefix(_TrieLetter currentNodeLetter, String characterPrefixName) {
    final characters = <MarvelCharacter>[];
    if (currentNodeLetter.isEndOfWord) {
      characters.addAll(currentNodeLetter.characters);
    }

    currentNodeLetter.children.forEach((letter, node) {
      characters.addAll(_searchCharactersByFoundPrefix(node, characterPrefixName + letter));
    });

    return characters;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FilterCharactersTrieUsecase && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
