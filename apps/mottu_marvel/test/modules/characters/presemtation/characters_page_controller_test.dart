import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get/get.dart';

import 'package:mottu_marvel/modules/characters/presentation/pagers/characters_page_controller.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late CharactersPageController controller;
  late MockCharactersRepository mockRepository;

  setUp(() {
    Get.reset();
    mockRepository = MockCharactersRepository();
    Get.put<CharactersRepository>(mockRepository);
    controller = CharactersPageController();
  });

  tearDown(() {
    Get.reset();
  });

  group('CharactersPageController Tests', () {
    test(
        'Given the initial state as empty characters list, when the screen loads, then the controller fetches initial characters list',
        () async {
      const mockMarvelResponse = MarvelResponse(
        etag: '123',
        data: MarvelData(
          offset: 0,
          limit: 20,
          total: 100,
          count: 20,
          results: [
            MarvelCharacter(
              id: 1,
              name: 'Iron Man',
              description: 'The iron man desc....',
              thumbnail: MarvelThumbnail(
                path: 'path',
                extension: 'extension',
              ),
            ),
            MarvelCharacter(
              id: 2,
              name: 'Captain America',
              description: 'The captain american description...',
              thumbnail: MarvelThumbnail(
                path: 'path',
                extension: 'extension',
              ),
            ),
          ],
        ),
      );

      when(() => mockRepository.fetchCharacters(
            offset: any(named: 'offset'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => mockMarvelResponse);

      await controller.fetchCharacters();

      expect(controller.charactersList.length, 2);
      expect(controller.charactersList[0].name, 'Iron Man');
      expect(controller.charactersList[1].name, 'Captain America');
      expect(controller.isFetching.value, false);
    });

    test(
        'Given there\'s no characters fetch process - isFetching is false, when a new fetch starts, then isFetching is true',
        () async {
      const mockMarvelResponse = MarvelResponse(
        etag: '123',
        data: MarvelData(
          offset: 0,
          limit: 20,
          total: 100,
          count: 20,
          results: [],
        ),
      );

      when(() => mockRepository.fetchCharacters(
            offset: any(named: 'offset'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return mockMarvelResponse;
      });

      final fetchFuture = controller.fetchCharacters();

      expect(controller.isFetching.value, true);
      await fetchFuture;
      expect(controller.isFetching.value, false);
    });

    test(
        'When the initial characters is loaded, when the user scrolls to the end of the list, then the next pagination fetches a new list of characters',
        () async {
      const initialResponse = MarvelResponse(
        etag: '123',
        data: MarvelData(
          offset: 0,
          limit: 20,
          total: 100,
          count: 20,
          results: [
            MarvelCharacter(
              id: 1,
              name: 'Iron Man',
              description: 'asdfasdf',
              thumbnail: MarvelThumbnail(path: 'path', extension: 'extension'),
            ),
          ],
        ),
      );

      const nextPageResponse = MarvelResponse(
        etag: '123',
        data: MarvelData(
          offset: 20,
          limit: 20,
          total: 100,
          count: 20,
          results: [
            MarvelCharacter(
              id: 2,
              name: 'Thor',
              description: 'asdfsfgfg',
              thumbnail: MarvelThumbnail(path: 'path', extension: 'extension'),
            ),
          ],
        ),
      );

      when(() => mockRepository.fetchCharacters(offset: 0, limit: any(named: 'limit')))
          .thenAnswer((_) async => initialResponse);
      when(() => mockRepository.fetchCharacters(offset: 20, limit: any(named: 'limit')))
          .thenAnswer((_) async => nextPageResponse);

      await controller.fetchCharacters();
      controller.offset = 20;
      await controller.fetchCharacters(offset: controller.offset);

      expect(controller.charactersList.length, 2);
      expect(controller.charactersList[1].name, 'Thor');
    });
  });
}
