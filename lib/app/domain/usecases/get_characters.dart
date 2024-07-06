import 'package:dartz/dartz.dart';
import 'package:mottu_marvel/app/core/usecases/usecase.dart';
import 'package:mottu_marvel/app/data/models/get_characters_response.dart';
import 'package:mottu_marvel/app/domain/repositories/character_repository.dart';
import 'package:mottu_marvel/app/core/error/failures.dart';

class GetCharacters
    extends UseCase<GetCharactersResponse, GetCharactersParams> {
  final CharacterRepository _repo;

  GetCharacters(this._repo);

  @override
  Future<Either<Failure, GetCharactersResponse>> call(
          GetCharactersParams params) =>
      _repo.getCharacters(params);
}

class GetCharactersParams {
  final int? limit;
  final int? offset;
  final String? nameStartsWith;

  GetCharactersParams({
    this.limit,
    this.offset,
    this.nameStartsWith,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['limit'] = limit;
    data['offset'] = offset;
    data['nameStartsWith'] = nameStartsWith;
    return data;
  }
}
