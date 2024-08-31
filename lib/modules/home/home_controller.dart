import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:marvel/services/api/marvel_characters_service_api.dart';

class HomeController extends GetxController with StateMixin<bool> {
  final MarvelCharactersServiceAPI marvelCharactersServiceAPI =
      MarvelCharactersServiceAPI();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    change(false, status: RxStatus.loading());
    super.onInit();
  }
}
