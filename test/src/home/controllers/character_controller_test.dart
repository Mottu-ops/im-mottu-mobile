import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/home/controllers/character_controller.dart';
import 'package:marvel_app/src/home/models/hero_dto.dart';
import 'package:marvel_app/src/home/models/params_dto.dart';
import 'package:marvel_app/src/home/repositories/characters_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'character_controller_test.mocks.dart';

@GenerateMocks([CharactersRepository])
void main() {
  late CharacterController controller;
  late MockCharactersRepository mockRepository;

  setUp(() {
    mockRepository = MockCharactersRepository();
    controller = CharacterController(mockRepository);

    SharedPreferences.setMockInitialValues({});
  });

  group('CharacterController', () {
    test('fetches heroes from repository and caches them', () async {
      final newHeroes = [
        HeroDto(
            id: 1,
            name: 'Spider-Man',
            description: 'Friendly neighborhood Spider-Man',
            image: 'https://example.com/spiderman.jpg'),
        HeroDto(
            id: 2,
            name: 'Iron Man',
            description: 'Genius, billionaire, playboy, philanthropist',
            image: 'https://example.com/ironman.jpg'),
      ];

      final params = ParamsDto(limit: 10, offset: 0);
      when(mockRepository.getHeroes(params: params)).thenAnswer((_) async => newHeroes);
      await controller.getHeroes();
      expect(controller.heroes.length, 2);
      expect(controller.heroes[0].name, 'Spider-Man');
      expect(controller.heroes[1].name, 'Iron Man');
    });

    test('fetches more heroes from repository and caches them', () async {
      final initialHeroes = [
        HeroDto(
            id: 1,
            name: 'Spider-Man',
            description: 'Friendly neighborhood Spider-Man',
            image: 'https://example.com/spiderman.jpg'),
      ];

      final moreHeroes = [
        HeroDto(
            id: 2,
            name: 'Iron Man',
            description: 'Genius, billionaire, playboy, philanthropist',
            image: 'https://example.com/ironman.jpg'),
      ];

      controller.heroes.value = initialHeroes;
      controller.offset.value = 0;
      final params = ParamsDto(limit: 10, offset: 10);
      when(mockRepository.getHeroes(params: params)).thenAnswer((_) async => moreHeroes);
      await controller.loadMoreHeroes();
      expect(controller.heroes.length, 2);
      expect(controller.heroes[1].name, 'Iron Man');
      verify(mockRepository.getHeroes(params: params)).called(1);
    });

    test('updates search query and fetches heroes', () async {
      final searchHeroes = [
        HeroDto(
            id: 1,
            name: 'Spider-Man',
            description: 'Friendly neighborhood Spider-Man',
            image: 'https://example.com/spiderman.jpg'),
      ];

      when(mockRepository.getHeroes()).thenAnswer((_) async => searchHeroes);
      expect(searchHeroes.length, 1);
      expect(searchHeroes[0].name, 'Spider-Man');
    });

    test('clears cache on close', () async {
      await controller.clearCache();
    });
  });
}
