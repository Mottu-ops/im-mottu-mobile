import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:marvel/services/constants/app_routes.dart';
import 'package:marvel/services/logger.dart';

class SignStartUpController extends GetxController with StateMixin<bool> {
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
    FlutterNativeSplash.remove();
    change(false, status: RxStatus.success());
    super.onInit();
  }

  Future<void> load() async {
    try {
      Sha
    } catch (e) {
      Logger.info(e);
    }
  }

  Future<void> join() async {
    await Get.toNamed(AppRoutes.characterListPage);
  }
}
