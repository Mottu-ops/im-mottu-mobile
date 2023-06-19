import 'package:get/get.dart';
import '/controller/home.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}