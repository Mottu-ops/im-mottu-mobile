import 'package:dartz/dartz.dart';

import 'package:marvelapp/app/core/data/datasources/i_remote_datasource.dart';
import 'package:marvelapp/app/core/domain/entities/char_entity.dart';
import 'package:marvelapp/app/core/domain/repositories/i_characters_repository.dart';
import 'package:marvelapp/app/core/error/exceptions.dart';
import 'package:marvelapp/app/core/error/failures.dart';

import '../models/char_model.dart';

class CharactersRepository implements ICharactersRepository {
  final IRemoteDatasource _remoteDatasource;
  CharactersRepository({
    required IRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<IFailure, List<Char>>> getHeroes() async {
    try {
      List<CharModel> listHeroes = await _remoteDatasource.getHeroes();
      return Right(listHeroes.map((e) => e.toEntity()).toList());
    } on InternetException catch (e) {
      return const Left(
        InternalFailure(
          message: 'Error on assembling heroes from server',
        ),
      );
    }
  }
}
