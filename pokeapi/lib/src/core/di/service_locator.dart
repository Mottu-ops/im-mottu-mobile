import 'package:get_it/get_it.dart';
import 'package:pokeapi/src/features/pokemon/domain/repositories/pokemon_repository.dart';

import '../../features/pokemon/data/datasources/pokemon_datasource.dart';
import '../../features/pokemon/data/datasources/remote/pokemon_remote_datasource.dart';
import '../../features/pokemon/data/repositories/pokemon_repository_impl.dart';
import '../../features/pokemon/domain/usecases/fetch_pokemons/fetch_pokemons_usecase.dart';
import '../../features/pokemon/domain/usecases/fetch_pokemons/fetch_pokemons_usecase_impl.dart';
import '../../features/pokemon/presentation/notifiers/pokemon_notifier.dart';
import '../services/http_client/dio_http_client_service.dart';
import '../services/http_client/http_client_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  /// Services
  getIt.registerLazySingleton<HttpClientService>(
    () => DioHttpClientService(baseUrl: 'https://pokeapi.co/api/v2'),
  );

  /// Datasources
  getIt.registerLazySingleton<PokemonDatasource>(
    () =>
        PokemonRemoteDatasource(httpClientService: getIt<HttpClientService>()),
  );

  /// Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(datasource: getIt<PokemonDatasource>()),
  );

  /// UseCases
  getIt.registerLazySingleton<FetchPokemonsUseCase>(
    () => FetchPokemonsUsecaseImpl(repository: getIt<PokemonRepository>()),
  );

  /// Notifiers
  getIt.registerFactory(
    () => PokemonNotifier(fetchPokemonsUseCase: getIt<FetchPokemonsUseCase>()),
  );
}
