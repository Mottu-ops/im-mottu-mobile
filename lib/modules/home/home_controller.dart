import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    super.onReady();
  }
}
