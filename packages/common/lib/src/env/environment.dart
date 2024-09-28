import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get baseApiUrl => dotenv.env['BASE_API_URL']!;
  static String get marvelPublicKey => dotenv.env['MARVEL_PUBLIC_KEY']!;
  static String get marvelPrivateKey => dotenv.env['MARVEL_PRIVATE_KEY']!;
}
