import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/object/hero.dart' as hero;

class HomeController extends GetxController {

  final screenHeight = 0.0.obs;
  final screenWidth = 0.0.obs;
  final homeController = 0.0.obs;
  final darkMode = false.obs;
  final searchData = "".obs;
  static const apikey = ''; //Inserir chave de API Marvel
  static const ts = ''; //Inserir TimeStamp
  static const hash = ''; //Inserir hash da Marvel
  final heroes = [].obs;
  final RxList<Widget> heroesCard = [const SizedBox()].obs;
  final heroesCache = {}.obs;
  final charging = false.obs;
  final cardDetail = false.obs;
  final limit = false.obs;
  final selectedHero = hero.Hero(comics: [], series: [], related: []).obs;

  void updateScreenSize(double height, double width) {
    screenHeight(height);
    screenWidth(width);
  }

  void updatePage(double page) {
    homeController(page);
  }

  void updateDarkMode(bool mode) {
    darkMode(mode);
    Get.changeThemeMode(mode ? ThemeMode.dark : ThemeMode.light);
  }

  Future<List> searchHeroes(String search) async {
    charging(true);
    heroes.clear();
    Uri url;
    if(heroesCache.containsKey(search)){
      heroesCache.forEach((key, value) {
        if(key == search){
          heroes(value);
        }
      });
      charging(false);
      return heroes;
    }
    if(search.isEmpty){
      url = Uri.https('gateway.marvel.com', 'v1/public/characters', {'apikey': apikey, 'ts': ts, 'hash': hash});
    }else{
      url = Uri.https('gateway.marvel.com', 'v1/public/characters', {'apikey': apikey, 'ts': ts, 'hash': hash, 'nameStartsWith': search});
    }
    var response = await http.get(url);
    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['results'];
      for (var element in data) {
        List comics = [];
        List series = [];
        List tempComics = element['comics']['items'];
        List tempSeries = element['series']['items'];
        String tempUrl;
        List tempData;
        for (var element in tempComics) {
          tempUrl = element['resourceURI'];
          tempData = tempUrl.split('/');
          comics.add(tempData[6]);
        }
        for (var element in tempSeries) {
          tempUrl = element['resourceURI'];
          tempData = tempUrl.split('/');
          series.add(tempData[6]);
        }
        heroes.add(hero.Hero(id: element['id'], name: element['name'], description: element['description'], modified: DateTime.tryParse(element['modified']), smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}', largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}', comics: comics, series: series, related: []));
      }
      heroesCache[search] = heroes.toList();
      if(heroes.length == jsonDecode(response.body)['data']['total']) limit(true);
    }else{
      heroes([response.statusCode]);
    }
    charging(false);
    return heroes;
  }

  Future<List> updateHeroesList(String search) async {
    charging(true);
    Uri url;
    int offset = 0;
    heroesCache.forEach((key, value) {
      if(key == search){
         offset = value.length;
      }
    });
    if(search.isEmpty){
      url = Uri.https('gateway.marvel.com', 'v1/public/characters', {'apikey': apikey, 'ts': ts, 'hash': hash, 'offset': offset.toString()});
    }else{
      url = Uri.https('gateway.marvel.com', 'v1/public/characters', {'apikey': apikey, 'ts': ts, 'hash': hash, 'nameStartsWith': search, 'offset': offset.toString()});
    }
    var response = await http.get(url);
    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['results'];
      for (var element in data) {
        List comics = [];
        List series = [];
        List tempComics = element['comics']['items'];
        List tempSeries = element['series']['items'];
        String tempUrl;
        List tempData;
        for (var element in tempComics) {
          tempUrl = element['resourceURI'];
          tempData = tempUrl.split('/');
          comics.add(tempData[6]);
        }
        for (var element in tempSeries) {
          tempUrl = element['resourceURI'];
          tempData = tempUrl.split('/');
          series.add(tempData[6]);
        }
        heroes.add(hero.Hero(id: element['id'], name: element['name'], description: element['description'], modified: DateTime.tryParse(element['modified']), smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}', largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}', comics: comics, series: series, related: []));
      }
      heroesCache[search] = heroes.toList();
      if(heroes.length == jsonDecode(response.body)['data']['total']) limit(true);
    }else{
      heroes([response.statusCode]);
    }
    charging(false);
    return heroes;
  }

  void updateCharging() {
    charging(!charging.value);
  }

  Future<void> updateCardDetail({hero.Hero? heroInfo}) async {
    charging(!charging.value);
    Uri url;
    List<hero.Hero> related = [];
    for (var element in heroInfo!.comics) {
      url = Uri.https('gateway.marvel.com', 'v1/public/comics/$element/characters', {'apikey': apikey, 'ts': ts, 'hash': hash});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['results'];
        for (var element in data) {
          hero.Hero tempHero = hero.Hero(id: element['id'], name: element['name'], description: element['description'], modified: DateTime.tryParse(element['modified']), smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}', largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}', comics: [], series: [], related: []);
          if(tempHero.id != heroInfo.id){
            List comics = [];
            List series = [];
            List tempComics = element['comics']['items'];
            List tempSeries = element['series']['items'];
            String tempUrl;
            List tempData;
            for (var element in tempComics) {
              tempUrl = element['resourceURI'];
              tempData = tempUrl.split('/');
              comics.add(tempData[6]);
            }
            for (var element in tempSeries) {
              tempUrl = element['resourceURI'];
              tempData = tempUrl.split('/');
              series.add(tempData[6]);
            }
            related.add(
                hero.Hero(id: element['id'],
                    name: element['name'],
                    description: element['description'],
                    modified: DateTime.tryParse(element['modified']),
                    smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}',
                    largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}',
                    comics: comics,
                    series: series,
                    related: []
                )
            );
          }
        }
      }
    }
    for (var element in heroInfo.series) {
      url = Uri.https('gateway.marvel.com', 'v1/public/series/$element/characters', {'apikey': apikey, 'ts': ts, 'hash': hash});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['results'];
        for (var element in data) {
          hero.Hero tempHero = hero.Hero(id: element['id'], name: element['name'], description: element['description'], modified: DateTime.tryParse(element['modified']), smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}', largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}', comics: [], series: [], related: []);
          if(tempHero.id != heroInfo.id) {
            List comics = [];
            List series = [];
            List tempComics = element['comics']['items'];
            List tempSeries = element['series']['items'];
            String tempUrl;
            List tempData;
            for (var element in tempComics) {
              tempUrl = element['resourceURI'];
              tempData = tempUrl.split('/');
              comics.add(tempData[6]);
            }
            for (var element in tempSeries) {
              tempUrl = element['resourceURI'];
              tempData = tempUrl.split('/');
              series.add(tempData[6]);
            }
            related.add(
                hero.Hero(id: element['id'],
                    name: element['name'],
                    description: element['description'],
                    modified: DateTime.tryParse(element['modified']),
                    smallThumbnail: '${element['thumbnail']['path']}/standard_amazing.${element['thumbnail']['extension']}',
                    largeThumbnail: '${element['thumbnail']['path']}/portrait_incredible.${element['thumbnail']['extension']}',
                    comics: comics,
                    series: series,
                    related: []
                )
            );
          }
        }
      }
    }
    for (var indx = 0; indx < related.length; indx++) {
      for (var indx2 = 1; indx2 < related.length; indx2++) {
        if(related[indx].id == related[indx2].id) {
          related.removeAt(indx2);
        }
      }
    }
    heroInfo.related = related;
    selectedHero(heroInfo);
    charging(!charging.value);
    cardDetail(!cardDetail.value);
  }

}