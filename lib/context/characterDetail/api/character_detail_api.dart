import 'dart:developer';
import 'package:im_mottu_mobile/context/characterDetail/model/character_detail_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/components/snackbar/snackbar.dart';
import 'package:im_mottu_mobile/core/services/services_api.dart';

class CharacterDetailApi {
  final ServicesApi _servicesApi = ServicesApi();
  Future<CharacterDetailModel> getCharacterDetails(int id) async {
    try {
      String endpoint = 'characters/$id';
      var body = await _servicesApi.getRequest(endpoint);

      if (body != null) {
        return CharacterDetailModel.fromMap(body["results"][0]);
      } else {
        throw Exception('Failed to load character details');
      }
    } catch (e) {
      log('Erro: $e');
      AppSnackBar.error(messageText: 'Erro inesperado, tente novamente');
      throw Exception('Failed to load character details');
    }
  }

  Future<List<ComicsResumeModel>> getCharacterComics(int id) async {
    try {
      String endpoint = 'characters/$id/comics';
      var body = await _servicesApi.getRequest(endpoint);

      if (body != null) {
        print(body["results"]);
        return (body["results"] as List)
            .map((item) => ComicsResumeModel.fromMap(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load character comics');
      }
    } catch (e) {
      log('Erro: $e');
      AppSnackBar.error(messageText: 'Erro inesperado, tente novamente');
      throw Exception('Failed to load character comics');
    }
  }
}
