import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/core/data/datasources/remote_datasource.dart';
import 'package:marvelapp/app/core/data/repositories/characters_repository.dart';
import 'package:marvelapp/app/core/stores/characters_store.dart';
import 'package:marvelapp/app/core/usecases/get_heroes_from_server_usecase.dart';
import 'package:marvelapp/app/modules/home/home_module.dart';
import 'package:marvelapp/app/modules/splash/splash_module.dart';

import 'modules/details/details_module.dart';

class AppModule extends Module {
  static const String routeName = SplashModule.routeName;
  @override
  List<Bind> get binds => [
        // Services
        Bind((i) => Dio()),
        // Stores
        Bind((i) => CharactersStore()),
        // Usecases
        Bind((i) => GetHeroesFromServerUsecase(repository: i())),
        // Repositories
        Bind((i) => CharactersRepository(remoteDatasource: i())),
        // Datasources
        Bind((i) => RemoteDatasource(dio: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(SplashModule.routeName, module: SplashModule()),
        ModuleRoute(HomeModule.routeName, module: HomeModule()),
        ModuleRoute(DetailsModule.routeName, module: DetailsModule())
      ];
}
