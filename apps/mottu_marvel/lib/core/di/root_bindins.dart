import 'package:get/get.dart';
import 'package:mottu_marvel/core/routes/app_router.dart';

import '../services/connectivity_status_service.dart';

class RootBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(AppRouter());
    Get.put(ConnectivityStatusService(), permanent: true);
  }
}
