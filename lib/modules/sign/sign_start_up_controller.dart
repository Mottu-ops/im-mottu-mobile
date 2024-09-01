import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:marvel/constants/app_enumators.dart';
import 'package:marvel/constants/app_keys.dart';
import 'package:marvel/constants/app_routes.dart';
import 'package:marvel/services/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignStartUpController extends GetxController {
  final Rx<StartUpAnimationStatusType> _animationStatusType =
      Rx<StartUpAnimationStatusType>(StartUpAnimationStatusType.none);
  final Rx<bool> _autoSignIn = true.obs;

  StartUpAnimationStatusType get animationStatusType =>
      _animationStatusType.value;

  set animationStatusType(StartUpAnimationStatusType value) {
    _animationStatusType.value = value;
    _animationStatusType.refresh();
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      autoSignIn = prefs.getBool(AppKeys.autoSignIn) ?? false;
      if (autoSignIn) {
        await Get.toNamed(AppRoutes.characterListPage);
      } else {
        FlutterNativeSplash.remove();
      }
    } catch (e) {
      Logger.info(e);
    }
  }

  void join() async {
    animationStatusType = StartUpAnimationStatusType.started;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppKeys.autoSignIn, autoSignIn);
    await Future.delayed(
        const Duration(
          milliseconds: 1100,
        ), () async {
      animationStatusType = StartUpAnimationStatusType.completed;
      await Get.toNamed(AppRoutes.characterListPage);
      animationStatusType = StartUpAnimationStatusType.none;
    });
  }
}
