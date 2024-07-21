import 'app/shared/services/encrypt/encrypt_service.dart';

abstract class Env {
  static const String apiKey = String.fromEnvironment(
    "api_key",
  );
  static const String _apiPrivateKey = String.fromEnvironment(
    "api_private_key",
  );

  static String apiHashKey({String? timeStamp}) {
    var stringToHshMd5 = _apiPrivateKey + apiKey;
    if (timeStamp != null) {
      stringToHshMd5 = timeStamp + stringToHshMd5;
    }
    return EncryptService.md5(stringToHshMd5);
  }
}
