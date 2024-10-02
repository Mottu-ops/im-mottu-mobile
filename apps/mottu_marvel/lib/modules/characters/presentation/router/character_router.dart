import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/presentation/router/routes.dart';

class CharacterRouter {
  static Future<void> goToCharacterDetails(MarvelCharacter character) async {
    await Get.toNamed(
      CharactersRouteNames.CHARACTER_DETAILS,
      arguments: {'character': character},
      preventDuplicates: false,
    );
  }
}
