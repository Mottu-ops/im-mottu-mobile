import 'package:get/get.dart';
import 'package:mottu_marvel/characters/domain/repository/characters_repository.dart';

import '../../data/models/marvel_response_model.dart';

class CharactersPageController extends GetxController {
  final repository = Get.find<CharactersRepository>();
  final marvelResponse = Rxn<MarvelResponse>();

  @override
  void onInit() {
    super.onInit();

    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final fetchedResponse = await repository.fetchCharacters(offset: 0);
    marvelResponse.value = fetchedResponse;
  }
}
