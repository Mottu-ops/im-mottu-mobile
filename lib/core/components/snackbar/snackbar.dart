import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static success({required String messageText, int? seconds = 1}) {
    return Get.snackbar('Sucesso', messageText,
     duration: Duration(seconds: seconds!),
        colorText: AppThemes.white, backgroundColor: AppThemes.successRegular);
  }

  static error({required String messageText}) {
    return Get.snackbar('Erro', messageText,
        colorText: AppThemes.white, backgroundColor: AppThemes.errorRegular);
  }

  static warning({required String messageText, int? seconds = 1}) {
    return Get.snackbar('Atenção', messageText,
        colorText: AppThemes.white,
        duration: Duration(seconds: seconds!),
        backgroundColor: AppThemes.warningRegular);
  }
}
