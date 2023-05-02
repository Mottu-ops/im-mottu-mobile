import 'dart:convert';
import 'package:http/http.dart' as http;

class Character {
  Character({
    this.id,
    this.name,
    this.description,
    this.thumbnailUrl,
    this.thumbnailPath,
  });

  int? id;
  String? name;
  String? description;
  String? thumbnailUrl;
  String? thumbnailPath;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      thumbnailPath: '${json['thumbnail']['path']}/portrait_uncanny.${json['thumbnail']['extension']}',
    );
  }
}

Future<List<Character>> fetchCharacters() async {
  final url = Uri.parse('https://gateway.marvel.com:443/v1/public/characters?apikey=1b9e6b2dd74d358926e3b7aade77d80a&ts=1&hash=1180f3641ed576bfa17a4a1afb17ac0a');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<Character>.from(json['data']['results'].map((result) => Character.fromJson(result)));
  } else {
    throw Exception('Falha ao buscar os personagens.\nSTATUS CODE: ${response.statusCode}');
  }
}