import 'dart:convert';
import 'package:christianmarvelapi/data/models/characters_marvel.dart';
import 'package:christianmarvelapi/resources/config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CharactersController extends GetxController {

var isLoading = true.obs;
var charactersList = <CharactersMarvel>[].obs;

 @override
   void onInit() {
     getHeros();
     super.onInit();
   }

   void getHeros() async {
    // Limpa a lista antes de carregar novos dados
    charactersList.clear();

    String getMarvelUrl = generateUrl("characters", limit: "&limit=100");

    try {
      final response = await http.get(Uri.parse(getMarvelUrl));
      if (response.statusCode == 200) {
        var marvelJson = jsonDecode(response.body)["data"]["results"];
        List<CharactersMarvel> newMarvelCharacters = marvelJson.map<CharactersMarvel>(
        (c) => CharactersMarvel.fromJson(c)).toList();

        charactersList.addAll(newMarvelCharacters);
        isLoading.value = false;
      } else {
        throw Exception("Failed to load Hero's");
      }
    } catch (e) {
      print('Error: $e');
      // Lidar com erros aqui, podendo notificar o usuário se necessário.
    }
  }
}