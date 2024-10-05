import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_page_controller.dart';
import 'package:mottu_marvel/core/services/theme_service.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/presentation/widgets/character_item.dart';
import 'package:mottu_marvel/modules/characters/presentation/widgets/characters_page_progress_indicator.dart';

import '../../../../test_helpers/get_app_initialization.dart';

class MockCharactersPageController extends GetxController with Mock implements CharactersPageController {}

class MockThemeController extends GetxController with Mock implements ThemeController {}

class MockScrollController extends Mock implements ScrollController {}

class MockPage extends Mock implements GetPage {}

class MockScrollPosition extends Mock implements ScrollPosition {}

class MockMarvelResponse extends Mock implements MarvelResponse {}

class MarvelComicsMock extends Mock implements MarvelComics {}

class MarvelSeriesMock extends Mock implements MarvelSeries {}

class MarvelEventsMock extends Mock implements MarvelEvents {}

class MockMarvelCharacter extends Mock implements MarvelCharacter {}

class MockNavigator extends Mock implements GetInterface {}

void main() {
  late MockCharactersPageController mockController;
  late MockThemeController mockThemeController;
  late TextEditingController realTextEditingController;
  late ScrollController scrollController;
  late MockMarvelResponse mockMarvelResponse;

  const thumbnail = MarvelThumbnail(
    path: 'path',
    extension: 'extension',
  );

  final charactersList = [
    MarvelCharacter(
      id: 1,
      name: 'Iron Man',
      description: 'The iron man desc....',
      thumbnail: thumbnail,
      comics: MarvelComicsMock(),
      series: MarvelSeriesMock(),
      events: MarvelEventsMock(),
    ),
    MarvelCharacter(
      id: 2,
      name: 'Spider-Man',
      description: 'The iron man desc....',
      thumbnail: thumbnail,
      comics: MarvelComicsMock(),
      series: MarvelSeriesMock(),
      events: MarvelEventsMock(),
    ),
  ];

  setUp(() {
    Get.testMode = true;
    Get.reset();
    realTextEditingController = TextEditingController();
    scrollController = ScrollController();
    mockController = MockCharactersPageController();
    mockMarvelResponse = MockMarvelResponse();

    when(() => mockController.scrollController).thenReturn(scrollController);
    when(() => mockController.isFetching).thenReturn(false.obs);
    when(() => mockController.isError).thenReturn(false.obs);
    when(() => mockController.filteredCharactersList).thenReturn(RxList([]));
    when(() => mockController.searchFieldEditingController).thenReturn(realTextEditingController);

    mockThemeController = MockThemeController();
    Get.put<CharactersPageController>(mockController);
    Get.put<ThemeController>(mockThemeController);
  });

  tearDown(() {
    realTextEditingController.dispose();
    Get.reset();
  });

  group('CharactersPage Widget Tests', () {
    testWidgets('Given the characters page, when it is first loading, then it shows a progress indicator',
        (WidgetTester tester) async {
      when(() => mockController.marvelResponse).thenReturn(Rxn<MarvelResponse>(null));
      when(() => mockController.isFetching).thenReturn(false.obs);
      when(() => mockController.isError).thenReturn(false.obs);
      when(() => mockController.filteredCharactersList).thenReturn(RxList([]));
      when(() => mockController.searchTextFieldValue).thenReturn(RxString(''));

      await mockNetworkImages(() async => await tester.pumpWidget(createAppForCharactersPageUnderTest()));

      expect(find.byType(CharacterPageProgressIndicator), findsOneWidget);
    });

    testWidgets('Given a network error, when isError is true, then it shows an error message',
        (WidgetTester tester) async {
      when(() => mockController.marvelResponse).thenReturn(Rxn<MarvelResponse>(mockMarvelResponse));
      when(() => mockController.isError).thenReturn(true.obs);
      when(() => mockController.isFetching).thenReturn(false.obs);
      when(() => mockController.filteredCharactersList).thenReturn(RxList([]));
      when(() => mockController.searchTextFieldValue).thenReturn(RxString(''));

      await mockNetworkImages(() async => await tester.pumpWidget(createAppForCharactersPageUnderTest()));

      expect(find.text('Algo de errado aconteceu! :('), findsOneWidget);
    });

    testWidgets(
        'Given theres no filtered characters in list, when the user tries for look up for a specific characters, then it shows no results message and a button',
        (WidgetTester tester) async {
      when(() => mockController.marvelResponse).thenReturn(Rxn<MarvelResponse>(mockMarvelResponse));
      when(() => mockController.isError).thenReturn(false.obs);
      when(() => mockController.isFetching).thenReturn(false.obs);
      when(() => mockController.filteredCharactersList).thenReturn(RxList([]));
      when(() => mockController.searchTextFieldValue).thenReturn(RxString(''));

      await mockNetworkImages(() async => await tester.pumpWidget(createAppForCharactersPageUnderTest()));

      expect(find.text('Não há resultados locais. Deseja fazer uma busca remota?'), findsOneWidget);
      expect(find.text('SIM'), findsOneWidget);
    });

    testWidgets(
        'Given a success request to Marvel, When data is available and characters are listed, then it shows a list of characters',
        (WidgetTester tester) async {
      when(() => mockController.marvelResponse).thenReturn(Rxn<MarvelResponse>(mockMarvelResponse));
      when(() => mockController.filteredCharactersList).thenReturn(RxList(charactersList));
      when(() => mockController.isFetching).thenReturn(false.obs);
      when(() => mockController.searchTextFieldValue).thenReturn(RxString(''));

      await mockNetworkImages(() async => await tester.pumpWidget(createAppForCharactersPageUnderTest()));

      expect(find.text('Iron Man'), findsOneWidget);
      expect(find.text('Spider-Man'), findsOneWidget);
      expect(find.byType(MarvelCharacterItem), findsNWidgets(2));
    });

    testWidgets('Given the search field with contents, when a user types Limpa busca, it clears the search field',
        (WidgetTester tester) async {
      when(() => mockController.marvelResponse).thenReturn(Rxn<MarvelResponse>(mockMarvelResponse));
      when(() => mockController.filteredCharactersList).thenReturn(RxList(charactersList));
      when(() => mockController.isFetching).thenReturn(false.obs);
      when(() => mockController.searchTextFieldValue).thenReturn('Spider'.obs);
      when(() => mockController.clearSearchField()).thenReturn(null);

      await mockNetworkImages(() async => await tester.pumpWidget(createAppForCharactersPageUnderTest()));

      expect(find.text('Limpar busca'), findsOneWidget);

      await tester.tap(find.text('Limpar busca'));
      await tester.pumpAndSettle();

      verify(() => mockController.clearSearchField()).called(1);
    });
  });
}
