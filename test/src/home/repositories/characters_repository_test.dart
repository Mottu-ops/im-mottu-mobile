import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/common/infrastructure/http/http.dart';
import 'package:marvel_app/src/home/models/hero_dto.dart';
import 'package:marvel_app/src/home/models/params_dto.dart';
import 'package:marvel_app/src/home/repositories/characters_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'characters_repository_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  late CharactersRepository repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = CharactersRepository(mockHttpClient);
  });

  group('CharactersRepository', () {
    final params = ParamsDto(limit: 2, offset: 0);
    const endpoint = '/characters';

    test('returns a list of heroes if the http call completes successfully', () async {
      final jsonResponse = {
        'data': {
          'results': [
            {
              'id': 1,
              'name': 'Spider-Man',
              'description': 'Friendly neighborhood Spider-Man',
              'thumbnail': {'path': 'https://example.com/spiderman', 'extension': 'jpg'}
            },
            {
              'id': 2,
              'name': 'Iron Man',
              'description': 'Genius, billionaire, playboy, philanthropist',
              'thumbnail': {'path': 'https://example.com/ironman', 'extension': 'jpg'}
            },
            {
              'id': 3,
              'name': 'Hulk',
              'description': 'HULK SMASH!!!',
              'thumbnail': {'path': 'https://example.com/hulk', 'extension': 'jpg'}
            }
          ]
        }
      };

      when(mockHttpClient.get(endpoint, query: {
        'limit': params.limit,
        'offset': params.offset,
      })).thenAnswer((_) async => HttpResponse(
            data: jsonResponse,
            status: HttpStatus.ok,
          ));

      final heroes = await repository.getHeroes(params: params);

      expect(heroes, isA<List<HeroDto>>());
      expect(heroes.length, 3);
      expect(heroes[0].name, 'Spider-Man');
      expect(heroes[1].name, 'Iron Man');
      expect(heroes[2].name, 'Hulk');

      verify(mockHttpClient.get(endpoint, query: {
        'limit': params.limit,
        'offset': params.offset,
      })).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('returns an empty list if the http call completes with an error', () async {
      when(mockHttpClient.get(endpoint, query: {
        'limit': params.limit,
        'offset': params.offset,
      })).thenAnswer((_) async => const HttpResponse(
            data: {},
            status: HttpStatus.badRequest,
          ));

      final heroes = await repository.getHeroes(params: params);

      expect(heroes, isA<List<HeroDto>>());
      expect(heroes.length, 0);

      verify(mockHttpClient.get(endpoint, query: {
        'limit': params.limit,
        'offset': params.offset,
      })).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('returns a list of heroes if the http call completes successfully with nameStartsWith',
        () async {
      final paramsWithName = ParamsDto(limit: 2, offset: 0, nameStartsWith: 'Spid');
      final jsonResponse = {
        'data': {
          'results': [
            {
              'id': 1,
              'name': 'Spider-Man',
              'description': 'Friendly neighborhood Spider-Man',
              'thumbnail': {'path': 'https://example.com/spiderman', 'extension': 'jpg'}
            },
          ]
        }
      };

      when(mockHttpClient.get(endpoint, query: {
        'limit': paramsWithName.limit,
        'offset': paramsWithName.offset,
        'nameStartsWith': paramsWithName.nameStartsWith,
      })).thenAnswer((_) async => HttpResponse(
            data: jsonResponse,
            status: HttpStatus.ok,
          ));

      final heroes = await repository.getHeroes(params: paramsWithName);

      expect(heroes, isA<List<HeroDto>>());
      expect(heroes.length, 1);
      expect(heroes[0].name, 'Spider-Man');

      verify(mockHttpClient.get(endpoint, query: {
        'limit': paramsWithName.limit,
        'offset': paramsWithName.offset,
        'nameStartsWith': paramsWithName.nameStartsWith,
      })).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
