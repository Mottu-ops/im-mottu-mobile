import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_flutter/app/modules/home/data/repositories/home_repository.dart';
import 'package:im_mottu_flutter/app/modules/home/interactor/models/character_wrapper_model.dart';
import 'package:im_mottu_flutter/app/modules/home/interactor/repositories/i_home_repository.dart';
import 'package:im_mottu_flutter/app/shared/errors/http_client_error.dart';
import 'package:im_mottu_flutter/app/shared/services/http_client/http_response.dart';
import 'package:im_mottu_flutter/app/shared/services/http_client/i_http_client.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data.dart';

class HttpClientMock extends Mock implements IHttpClient {}

main() {
  late final IHomeRepository repository;
  late final IHttpClient httpClient;

  setUpAll(() {
    httpClient = HttpClientMock();
    repository = HomeRepository(httpClient);
  });

  group('Get character list', () {
    test('Must return a CharacterDataWrapper with a list characters when http client return response with success',
        () async {
      // mock
      when(() => httpClient.get(any()))
          .thenAnswer((_) async => HttpResponse(data: jsonDecode(apiResponseJson), statusCode: 200));

      // act
      final result = await repository.getCharacterListData();

      // assert
      expect(result.$1, isA<CharacterDataWrapper>());
      expect(result.$1?.data.results.isNotEmpty, true);
      expect(result.$2.isEmpty, true);
    });

    test('Must return a empty list of AssetsModel when http client throws a error', () async {
      // mock
      when(() => httpClient.get(any())).thenThrow(const HttpClientError(
          data: {'message': 'Expired token'}, message: '401 - Authentication invalid', stackTrace: null));

      // act
      final result = await repository.getCharacterListData();

      // assert
      expect(result.$1 == null, true);
      expect(result.$2, equals('401 - Authentication invalid'));
    });
  });
}
