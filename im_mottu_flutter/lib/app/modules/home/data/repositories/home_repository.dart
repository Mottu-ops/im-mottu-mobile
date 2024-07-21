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
  Future<(CharacterDataWrapper?, String errorMessage)> getCompanyList() async {
    try {
      final response = await httpClient.get('$kCharactersEndpoint?apikey=${Env.apiKey}',
          headers: {"Content-Type": "application/json; charset=utf-8"});
      final listCompanies = CharacterDataWrapper.fromMap(response.data);
      return (listCompanies, '');
    } on IFailure catch (e) {
      log(e.toString());
      return (null, e.message);
    }
  }
}
