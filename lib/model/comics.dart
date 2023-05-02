import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mottu_marvel/model/prices.dart';

import 'creators.dart';
class Comics {
  Comics({
      this.id, this.title, this.description,
      required this.price, this.thumbnailUrl,
      required this.creatorsName,
      this.pageCount,
  });

  int? id;
  String? title;
  String? description;
  List<Prices> price;
  List<Creators> creatorsName;
  String? thumbnailUrl;
  //String? thumbnailPath;
  String? creatorName;
  int? pageCount;


  factory Comics.fromJson(Map<String,dynamic> json){
    return Comics(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: List<Prices>.from(json['prices'].map((price) => Prices.fromJson(price))),
      thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      creatorsName: List<Creators>.from(json['creators']['items'].map((name) => Creators.fromJson(name))),
      pageCount: json['pageCount']
    );
  }
}



Future<List<Comics>> fetchComics ()async{
  final Uri url = Uri.parse('https://gateway.marvel.com:443/v1/public/comics?apikey=1b9e6b2dd74d358926e3b7aade77d80a&ts=1&hash=1180f3641ed576bfa17a4a1afb17ac0a');
  var response = await http.get(url);
  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    return List<Comics>.from(json['data']['results'].map((result) => Comics.fromJson(result)));  //.map((result) => Comics.fromJSON(result)));
  }else {
    throw Exception('Falha ao buscar os quadrinhos.\nSTATUS CODE: ${response.statusCode}');
  }
}
