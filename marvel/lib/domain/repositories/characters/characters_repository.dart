import 'package:dartz/dartz.dart';
import 'package:marvel/core/erros/erros.dart';
import 'package:marvel/domain/entities/characters/characters.dart';

abstract class CharactersRepositoryAbs {
  Future<Either<Failure, List<CharactersEntity>>> getList({String? orderBy});
}
