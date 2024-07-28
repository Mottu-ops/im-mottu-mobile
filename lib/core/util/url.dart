import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApiUrl {
  String get baseUrlApp => 'https://gateway.marvel.com:443/v1/public/';
  String get apiKey => dotenv.env['MARVEL_API_KEY']!;
  String get privateKey => dotenv.env['MARVEL_PRIVATE_KEY']!;
}