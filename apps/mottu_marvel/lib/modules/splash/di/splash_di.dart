import 'package:get/get.dart';
import 'package:mottu_marvel/modules/splash/presentation/pages/splash_page_controller.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashPageController>(SplashPageController());
  }
}
