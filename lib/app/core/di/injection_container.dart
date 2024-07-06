import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mottu_marvel/app/core/api/dio_client.dart';
import 'package:mottu_marvel/app/data/datasources/character_datasource.dart';
import 'package:mottu_marvel/app/data/datasources/character_remote_datasource_impl.dart';
import 'package:mottu_marvel/app/data/repositories/character_repository_impl.dart';
import 'package:mottu_marvel/app/domain/repositories/character_repository.dart';
import 'package:mottu_marvel/app/domain/usecases/get_characters.dart';
import 'package:mottu_marvel/app/presentation/home/bloc/home_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init({bool isUnitTest = false}) async {
  /// For unit testing only

  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
  } else {
    sl.registerSingleton<DioClient>(DioClient());
  }

  dataSources();
  repositories();
  useCase();
  bloc();
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(sl()),
  );
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<CharacterDatasource>(
    () => CharacterRemoteDatasourceImpl(sl()),
  );
}

void useCase() {
  sl.registerLazySingleton(() => GetCharacters(sl()));
}

void bloc() {
  sl.registerFactory(
    () => HomeBloc(
      getCharacters: sl(),
    ),
  );
}
