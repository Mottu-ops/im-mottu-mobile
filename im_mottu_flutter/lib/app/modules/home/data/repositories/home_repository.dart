import 'dart:developer';

import 'package:im_mottu_flutter/env.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/errors/i_failure.dart';
import '../../../../shared/services/http_client/i_http_client.dart';
import '../../interactor/models/character_wrapper_model.dart';
import '../../interactor/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final IHttpClient httpClient;

  HomeRepository(this.httpClient);
  @override
  Future<(CharacterDataWrapper?, String errorMessage)> getCharacterListData() async {
    try {
      final dateTime = DateTime.now().add(const Duration(minutes: 5)).millisecondsSinceEpoch.toString();
      final response = await httpClient.get(
        '$kCharactersEndpoint?ts=$dateTime&apikey=${Env.apiKey}&hash=${Env.apiHashKey(timeStamp: dateTime)}',
      );
      final characterData = CharacterDataWrapper.fromMap(response.data);
      return (characterData, '');
    } on IFailure catch (e) {
      log(e.toString());
      return (null, e.message);
    }
  }
}
