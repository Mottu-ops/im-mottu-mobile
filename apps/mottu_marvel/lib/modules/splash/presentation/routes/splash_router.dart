import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/router/routes.dart';

class SplashRouter {
  static Future<void> goToCharacterList() async {
    await Get.offNamed(CharactersRouteNames.CHARACTERS);
  }
}
