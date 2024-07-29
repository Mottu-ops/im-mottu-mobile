import 'dart:developer';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/components/snackbar/snackbar.dart';
import 'package:im_mottu_mobile/core/services/services_api.dart';

class CharacterApi {
  final ServicesApi _servicesApi = ServicesApi();

  Future<List<CharacterModel>> getCharacters(
      {required int offset, required String query}) async {
    try {
      String endpoint = 'characters';
      Map<String, dynamic> params = query.isNotEmpty
          ? {
              'offset': offset,
              'limit': 10,
              'nameStartsWith': query,
            }
          : {
              'offset': offset,
              'limit': 20,
            };

      var body = await _servicesApi.getRequest(endpoint, params: params);

      if (body != null) {
        List<CharacterModel> characters = (body["results"] as List).map((e) {
          return CharacterModel.fromMap(e);
        }).toList();
        return characters;
      } else {
        return [];
      }
    } catch (e) {
      log('Erro: $e');
      AppSnackBar.error(messageText: 'Erro inesperado, tente novamente');
      return [];
    }
  }
}
