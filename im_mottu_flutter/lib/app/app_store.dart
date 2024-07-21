import 'package:get/get.dart';

import 'app_state.dart';
import 'shared/services/theme/theme_app_state.dart';
import 'shared/services/theme/theme_app_store.dart';

class AppStore extends GetxController {
  final ThemeAppStore themeAppStore;
  AppState state = AppState.empty();

  AppStore(this.themeAppStore);

  Future<void> getThemeApp() async {
    themeAppStore.getThemeApp();
  }

  void changeTheme(ThemeEnum theme) {
    themeAppStore.changeTheme(theme);
  }

  void updateTheme(ThemeAppState themeState) {
    state = state.copyWith(themeState: themeState);
    update();
  }
}
