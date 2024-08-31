import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:marvel/services/constants/app_keys.dart';
import 'package:marvel/services/constants/app_routes.dart';
import 'package:marvel/services/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignStartUpController extends GetxController {
  final Rx<bool> _shouldAnimate = false.obs;
  final Rx<bool> _autoSignIn = false.obs;

  bool get shouldAnimate => _shouldAnimate.value;

  set shouldAnimate(bool value) {
    _shouldAnimate.value = value;
    _shouldAnimate.refresh();
  }

  bool get autoSignIn => _autoSignIn.value;

  set autoSignIn(bool value) {
    _autoSignIn.value = value;
    _autoSignIn.refresh();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    try {
      FlutterNativeSplash.remove();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      autoSignIn = prefs.getBool(AppKeys.autoSignIn) ?? false;
    } catch (e) {
      Logger.info(e);
    }
  }

  void join() async {
    shouldAnimate = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppKeys.autoSignIn, autoSignIn);
    await Future.delayed(
        const Duration(
          milliseconds: 2500,
        ), () async {
      await Get.toNamed(AppRoutes.characterListPage);
    });
    shouldAnimate = false;
  }
}
