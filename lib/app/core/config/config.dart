import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get publicKey => dotenv.get('PUBLIC_KEY');
  static String get privateKey => dotenv.get('PRIVATE_KEY');
}
