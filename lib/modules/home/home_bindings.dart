import 'package:get/get.dart';
import 'package:marvel/modules/character/character_bindings.dart';
import 'package:marvel/modules/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    CharacterBindings().dependencies();
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
