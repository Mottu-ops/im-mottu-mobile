import 'dart:async';
import 'package:common/common.dart';
import 'package:get/get.dart';

import '../../../../core/services/app_lifecycle_service.dart';
import '../routes/splash_router.dart';

class SplashPageController extends GetxController {
  final loadingStatus = 0.obs;
  late List<Future<void> Function()> tasks;

  @override
  Future<void> onInit() async {
    super.onInit();

    tasks = [
      () async => Get.put(AppLifecycleService(), permanent: true),
      () async => lockRotation(),
    ];

    final totalTasks = tasks.length;

    for (int i = 0; i < totalTasks; i++) {
      await tasks[i]();
      _updateLoadingStatus(i + 1, totalTasks);
      await Future.delayed(const Duration(seconds: 1)); //Just to make the screen keep alive a little bit... :)
    }

    SplashRouter.goToCharacterList();
  }

  void _updateLoadingStatus(int completedTasks, int totalTasks) {
    final percentage = (completedTasks / totalTasks) * 100;
    loadingStatus.value = percentage.toInt();
  }
}
