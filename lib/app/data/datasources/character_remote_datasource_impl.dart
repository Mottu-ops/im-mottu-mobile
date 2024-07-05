import 'package:dartz/dartz.dart';
import 'package:mottu_marvel/app/core/api/dio_client.dart';
import 'package:mottu_marvel/app/data/datasources/character_datasource.dart';
import 'package:mottu_marvel/app/data/models/get_characters_response.dart';
import 'package:mottu_marvel/app/domain/usecases/get_characters.dart';
import 'package:mottu_marvel/app/error/failures.dart';

class CharacterRemoteDatasourceImpl implements CharacterDatasource {
  final DioClient _client;

  CharacterRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, GetCharactersResponse>> getCharacters(
    GetCharactersParams params,
  ) async {
    final response = await _client.getRequest(
      '/v1/public/characters',
      queryParameters: {
        'limit': params.limit,
        'offset': params.offset,
        if (params.nameStartsWith?.isNotEmpty ?? false)
          'nameStartsWith': params.nameStartsWith,
      },
      //queryParameters: params.toJson(),
      converter: (response) => const GetCharactersResponse().fromJson(
        response['data'],
      ),
    );

    return response;
  }
}
