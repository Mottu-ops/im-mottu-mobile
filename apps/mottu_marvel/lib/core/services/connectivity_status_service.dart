import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/core/routes/app_router.dart';

class ConnectivityStatusService extends GetxService {
  final router = Get.find<AppRouter>();
  final connectivityStatus = ConnectivityStatus();

  final RxString connectionStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('Starting connectivity status service');
    _startConnectivityListener();
  }

  void _startConnectivityListener() {
    connectivityStatus.startConnectivityStatusService().listen((data) {
      print('status $data');
      router.showSnackbar('Conexão', 'Sua conexão é $data');
    });
  }
}
