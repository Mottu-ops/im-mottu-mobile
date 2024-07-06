import 'package:dartz/dartz.dart';
import 'package:mottu_marvel/app/data/models/get_characters_response.dart';
import 'package:mottu_marvel/app/domain/usecases/get_characters.dart';
import 'package:mottu_marvel/app/core/error/failures.dart';

abstract class CharacterDatasource {
  Future<Either<Failure, GetCharactersResponse>> getCharacters(
    GetCharactersParams params,
  );
}
