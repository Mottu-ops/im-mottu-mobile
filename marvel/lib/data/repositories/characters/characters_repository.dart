import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/core/erros/erros.dart';
import 'package:marvel/data/datasources/datasources.dart';
import 'package:marvel/domain/domain.dart';

@LazySingleton(as: CharactersRepositoryAbs)
class CharactersRepositoryImpl implements CharactersRepositoryAbs {
  CharactersRepositoryImpl({
    required CharactersDatasourceAbs charactersDatasource,
  }) : _charactersDatasource = charactersDatasource;

  final CharactersDatasourceAbs _charactersDatasource;

  @override
  Future<Either<Failure, List<CharactersEntity>>> getList({
    String? orderBy,
  }) async {
    try {
      final List<CharactersEntity> charactersEntity =
          await _charactersDatasource.getList(orderBy: orderBy);

      return Right(charactersEntity);
    } on HttpException {
      const Left(HttpFailure());
    }
    throw UnimplementedError();
  }
}
