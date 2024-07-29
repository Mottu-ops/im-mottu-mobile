import 'dart:developer';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/components/snackbar/snackbar.dart';
import 'package:im_mottu_mobile/core/services/services_api.dart';

class HomeApi {
  final ServicesApi _servicesApi = ServicesApi();

  Future<List<CharacterModel>> getCharacters(
      {required int offset, required String query}) async {
    try {
      String endpoint = 'characters';
      Map<String, dynamic> params = {
        'offset': offset,
        'limit': 10,
      };

      var body = await _servicesApi.getRequest(endpoint, params: params);

      if (body != null) {
        List<CharacterModel> character =
            (body["results"] as List).map((e) {
          return CharacterModel.fromMap(e);
        }).toList();
        return character;
      } else {
        return [];
      }
    } catch (e) {
      log('Erro: $e');
      AppSnackBar.error(messageText: 'Erro inesperado, tente novamente');
      return [];
    }
  }

  Future<List<ComicsResumeModel>> getComics(
      {required int offset, required String query}) async {
    try {
      String endpoint = 'comics';
      Map<String, dynamic> params = {
        'offset': offset,
        'limit': 5,
      };

      var body = await _servicesApi.getRequest(endpoint, params: params);

      if (body != null) {
        List<ComicsResumeModel> comics = (body["results"] as List).map((e) {
          return ComicsResumeModel.fromMap(e);
        }).toList();
        return comics;
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
