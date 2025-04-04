import 'package:get/get.dart';
import 'package:pokedex/app/core/domain/http_adapters/i_http_client_adapter.dart';
import 'package:pokedex/app/core/infrastructure/adapters/dio/dio_adapter.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pokemon_list/pokemon_list_page_controller.dart';

class PokemonListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IHttpClientAdapter>(DioAdapter());
    Get.lazyPut<PokemonListPageController>(() => PokemonListPageController());
  }
}
