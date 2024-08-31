import 'package:get/get.dart';
import 'package:marvel/modules/sign/sign_start_up_controller.dart';

class SignStartUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignStartUpController>(() => SignStartUpController());
  }
}
