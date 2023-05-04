import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/data/models/characters/characters.dart';
import 'package:marvel/domain/domain.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../mocks/characters_mock.dart';

void main() {
  final CharactersModel tCharactersModel = CharactersMock.charactersModel;
  test('should be a subclass of CharactersEntity', () async {
    expect(tCharactersModel, isA<CharactersEntity>());
  });

  test('should be a subclass of CharactersModel', () async {
    expect(tCharactersModel, isA<CharactersModel>());
  });

  test('hould be return a valid model when the json is a list characters valid',
      () {
    final json = jsonDecode(fixture('characters.json'));

    final results = json['data']['results'] as List;

    CharactersModel.fromJson(results.first);
  });
}
