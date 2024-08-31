import 'package:get/get.dart';
import 'package:marvel/modules/character/character_controller.dart';

class CharacterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(() => CharacterController());
  }
}
