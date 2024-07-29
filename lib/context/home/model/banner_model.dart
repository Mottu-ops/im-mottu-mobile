import 'dart:convert';


class BannerModel {

  int id;
  String img;
  String title;
  String description;
  String keyPhrase;
  BannerModel({
    required this.id,
    required this.img,
    required this.title,
    required this.description,
    required this.keyPhrase,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'img': img,
      'title': title,
      'description': description,
      'keyPhrase': keyPhrase,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as int,
      img: map['img'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      keyPhrase: map['keyPhrase'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) => BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
