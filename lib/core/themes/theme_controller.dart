import 'package:get/get.dart';

class ThemeController extends GetxController {
 // Inicialmente definido como tema escuro
  RxBool isDarkMode = false.obs;  // Começa com o tema claro

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  @override
  void onInit() {
    toggleTheme();
    super.onInit();
  }


}
