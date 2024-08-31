import 'package:get/get.dart';
import 'package:marvel/mixins/infinite_scroll_mixin_controller.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/character/character_detail_page.dart';
import 'package:marvel/services/api/marvel_characters_service_api.dart';
import 'package:marvel/services/logger.dart';

class CharacterController extends GetxController
    with InfiniteScrollMixinController, StateMixin<bool> {
  final MarvelCharactersServiceAPI marvelCharactersServiceAPI =
      MarvelCharactersServiceAPI();

  @override
  int get limit => 20;

  @override
  void onInit() {
    list(0);

    super.onInit();
  }

  @override
  Future<void> list(int offset) async {
    try {
      super.list(offset);
      List<Character> characters = await marvelCharactersServiceAPI.list(
        offset: items.length,
        limit: limit,
      );
      updateItems(offset, characters);
      change(true, status: RxStatus.success());
    } catch (e) {
      Logger.info(e);
    }
  }

  Future<void> detail(Character character) async {
    try {
      // await marvelCharactersServiceAPI.get(character.id);
      await Get.to(
        () => CharacterDetailPage(character: character),
        fullscreenDialog: true,
        transition: Transition.downToUp,
      );
    } catch (e) {
      Logger.info(e);
    }
  }
}
