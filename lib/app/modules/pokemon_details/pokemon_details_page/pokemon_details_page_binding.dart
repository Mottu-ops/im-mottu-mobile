import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_page/pokemon_details_page_controller.dart';

class PokemonDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonDetailsPageController>(
        () => PokemonDetailsPageController());
  }
}
