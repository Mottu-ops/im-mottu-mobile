// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:marvel/data/datasources/characters/characters_datasource.dart'
    as _i4;
import 'package:marvel/data/datasources/datasources.dart' as _i7;
import 'package:marvel/data/repositories/characters/characters_repository.dart'
    as _i6;
import 'package:marvel/di/modules/http_module.dart' as _i10;
import 'package:marvel/domain/domain.dart' as _i5;
import 'package:marvel/domain/usecases/characters/get_list_characters.dart'
    as _i8;
import 'package:marvel/presentation/home/bloc/get_characters/get_characters_bloc.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpModule = _$HttpModule();
    gh.lazySingleton<_i3.Client>(
      () => httpModule.httpClient,
      instanceName: 'http_module',
    );
    gh.lazySingleton<_i4.CharactersDatasourceAbs>(() =>
        _i4.CharactersDatasourceImpl(
            client: gh<_i3.Client>(instanceName: 'http_module')));
    gh.lazySingleton<_i5.CharactersRepositoryAbs>(() =>
        _i6.CharactersRepositoryImpl(
            charactersDatasource: gh<_i7.CharactersDatasourceAbs>()));
    gh.lazySingleton<_i8.GetListCharactersUsecase>(() =>
        _i8.GetListCharactersUsecase(
            charactersRepositoryAbs: gh<_i5.CharactersRepositoryAbs>()));
    gh.factory<_i9.GetListCharactersBloc>(() => _i9.GetListCharactersBloc(
        getListCharacters: gh<_i8.GetListCharactersUsecase>()));
    return this;
  }
}

class _$HttpModule extends _i10.HttpModule {}
