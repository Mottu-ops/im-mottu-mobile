import '../../entities/pokemon_entity.dart';

abstract interface class FetchPokemonsUseCase {
  Future<List<PokemonEntity>> call({required int pageLimit, required int pageOffset});
}
