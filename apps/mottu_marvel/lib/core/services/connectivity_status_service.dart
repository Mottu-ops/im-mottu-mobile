import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/core/routes/app_router.dart';

class ConnectivityStatusService extends GetxService {
  final router = Get.find<AppRouter>();
  late ConnectivityStatus connectivityStatus;

  final RxString connectionStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('Starting connectivity status service');
    _startConnectivityListener();
  }

  void _startConnectivityListener() {
    if (Environment.isAndroid) {
      connectivityStatus = ConnectivityStatus();
      connectivityStatus.startConnectivityStatusService().listen((data) {
        print('status $data');
        router.showSnackbar('Conexão', 'Sua conexão é $data');
      });
    }
  }
}
