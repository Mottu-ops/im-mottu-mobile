import 'dart:developer';
import 'package:im_mottu_mobile/context/characterDetail/model/character_detail_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/components/snackbar/snackbar.dart';
import 'package:im_mottu_mobile/core/services/services_api.dart';

class CharacterDetailApi {
  final ServicesApi _servicesApi = ServicesApi();
  Future<CharacterDetailModel?> getCharacterDetails(int id) async {
    try {
      String endpoint = 'characters/$id';
      var body = await _servicesApi.getRequest(endpoint);

      if (body != null) {
        return CharacterDetailModel.fromMap(body["results"][0]);
      } else {
        return null;
      }
    } catch (e) {
      log('Erro: $e');
      AppSnackBar.error(messageText: 'Erro inesperado, tente novamente');
      return null;
    }
  }

  Future<List<ComicsResumeModel>> getCharacterComics(int id) async {
    try {
      String endpoint = 'characters/$id/comics';

      Map<String, dynamic> params = {
        'offset': 0,
        'limit': 5,
      };

      var body = await _servicesApi.getRequest(endpoint, params: params);

      if (body != null) {
        print(body["results"]);
        return (body["results"] as List)
            .map((item) =>
                ComicsResumeModel.fromMap(item as Map<String, dynamic>))
            .toList();
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
