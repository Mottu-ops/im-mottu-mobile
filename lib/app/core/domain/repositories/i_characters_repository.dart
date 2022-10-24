import 'package:dartz/dartz.dart';
import 'package:marvelapp/app/core/error/failures.dart';

import '../entities/char_entity.dart';

abstract class ICharactersRepository {
  Future<Either<IFailure, List<Char>>> getHeroes();
}
