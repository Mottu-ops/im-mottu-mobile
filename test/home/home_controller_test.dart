// // home_controller_test.dart
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
// import 'package:im_mottu_mobile/context/home/api/home_api.dart';
// import 'package:im_mottu_mobile/context/home/controller/home_controller.dart';
// import 'package:im_mottu_mobile/context/home/model/charater_resume_model.dart';
// import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
// import 'package:im_mottu_mobile/core/services/services_cache.dart';


// // home_api_mock.dart
// class MockHomeApi extends Mock implements HomeApi {}

// // cache_service_mock.dart
// class MockCacheService extends Mock implements CacheService {}


// void main() {
//   late HomeController homeController;
//   late MockHomeApi mockHomeApi;
//   late MockCacheService mockCacheService;

//   setUp(() {
//     mockHomeApi = MockHomeApi();
//     mockCacheService = MockCacheService();
//     homeController = HomeController();
//     homeController.apiService = mockHomeApi;
//     homeController.cacheService = mockCacheService;
//   });

//   group('HomeController Test', () {
//     test('Fetch Characters - Success', () async {
//       // Arrange
//       List<CharacterResumeModel> characters = [
//         CharacterResumeModel(id: 1, name: 'Spider-Man', thumbnail: 'path.jpg', description: 'A hero')
//       ];
//       when(mockHomeApi.getCharacters(offset: anyNamed('offset'), query: anyNamed('query')))
//           .thenAnswer((_) async => characters);

//       // Act
//       await homeController.fetchCharacters();

//       // Assert
//       expect(homeController.characters, characters);
//       verify(mockHomeApi.getCharacters(offset: anyNamed('offset'), query: anyNamed('query'))).called(1);
//     });

//     test('Fetch Comics - Success', () async {
//       // Arrange
//       List<ComicsResumeModel> comics = [
//         ComicsResumeModel(id: 1, title: 'Comic 1', description: 'A comic', thumbnail: 'path.jpg')
//       ];
//       when(mockHomeApi.getComics(offset: anyNamed('offset'), query: anyNamed('query')))
//           .thenAnswer((_) async => comics);

//       // Act
//       await homeController.fetchComics();

//       // Assert
//       expect(homeController.comics, comics);
//       verify(mockHomeApi.getComics(offset: anyNamed('offset'), query: anyNamed('query'))).called(1);
//     });

//     test('On Search', () async {
//       // Arrange
//       List<CharacterResumeModel> characters = [
//         CharacterResumeModel(id: 1, name: 'Spider-Man', thumbnail: 'path.jpg', description: 'A hero')
//       ];
//       List<ComicsResumeModel> comics = [
//         ComicsResumeModel(id: 1, title: 'Comic 1', description: 'A comic', thumbnail: 'path.jpg')
//       ];
//       when(mockHomeApi.getCharacters(offset: anyNamed('offset'), query: anyNamed('query')))
//           .thenAnswer((_) async => characters);
//       when(mockHomeApi.getComics(offset: anyNamed('offset'), query: anyNamed('query')))
//           .thenAnswer((_) async => comics);

//       // Act
//       homeController.onSearch('Spider-Man');

//       // Assert
//       verify(mockHomeApi.getCharacters(offset: anyNamed('offset'), query: anyNamed('query'))).called(1);
//       verify(mockHomeApi.getComics(offset: anyNamed('offset'), query: anyNamed('query'))).called(1);
//     });

//     test('Set Cache', () async {
//       // Arrange
//       when(mockCacheService.writeCache(any, any)).thenAnswer((_) async => Future.value());

//       // Act
//       await homeController.setCache();

//       // Assert
//       verify(mockCacheService.writeCache(any, any)).called(1);
//     });

//     test('Read Cache', () async {
//       // Arrange
//       String jsonCharacters = '[{"id": 1, "name": "Spider-Man", "thumbnail": "path.jpg", "description": "A hero"}]';
//       when(mockCacheService.readCache(any)).thenAnswer((_) async => jsonCharacters);

//       // Act
//       List<CharacterResumeModel> result = await homeController.readCache();

//       // Assert
//       expect(result.length, 1);
//       expect(result[0].name, 'Spider-Man');
//       verify(mockCacheService.readCache(any)).called(1);
//     });
//   });
// }