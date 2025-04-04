import 'package:get/get.dart';
import 'package:pokedex/app/core/application/models/pokemon_model.dart';
import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/application/use_cases/pokemon_details_use_case.dart';

class PokemonDetailsPageController extends GetxController {
  PokemonPreviewModel pokemonPreviewModel =
      Get.arguments as PokemonPreviewModel;
  final PokemonDetailsUseCase _pokemonDetailsUseCase = PokemonDetailsUseCase();
  PokemonModel? pokemonModel;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    pokemonModel =
        await _pokemonDetailsUseCase.getPokemon(pokemonPreviewModel.id);
  }
}
