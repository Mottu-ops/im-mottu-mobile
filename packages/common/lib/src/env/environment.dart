import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static bool get isIOS => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;
  static String get baseApiUrl => dotenv.env['BASE_API_URL']!;
  static String get marvelPublicKey => dotenv.env['MARVEL_PUBLIC_KEY']!;
  static String get marvelPrivateKey => dotenv.env['MARVEL_PRIVATE_KEY']!;
}
