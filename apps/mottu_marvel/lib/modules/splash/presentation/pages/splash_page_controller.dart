import 'dart:async';
import 'package:analytics/analytics.dart';
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
      () async => setFlavor(),
      () async => await dotenv.load(),
      () async => Get.put(AppLifecycleService()),
      () async => lockRotation(),
      () async => getApplicationDirectory(),
      () async => initFirebase()
    ];

    final totalTasks = tasks.length;

    for (int i = 0; i < totalTasks; i++) {
      await tasks[i]();
      _updateLoadingStatus(i + 1, totalTasks);
      await Future.delayed(const Duration(milliseconds: 500)); //Just to make the screen keep alive a little bit... :)
    }

    SplashRouter.goToCharacterList();
  }

  void _updateLoadingStatus(int completedTasks, int totalTasks) {
    final percentage = (completedTasks / totalTasks) * 100;
    loadingStatus.value = percentage.toInt();
  }
}
