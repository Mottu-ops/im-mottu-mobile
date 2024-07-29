import 'dart:convert';

class ComicsResumeModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  ComicsResumeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory ComicsResumeModel.fromMap(Map<String, dynamic> map) {
    return ComicsResumeModel(
      id: map['id'] as int,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
    );
  }

  Map<String, dynamic> toMap() {
    final parts = thumbnail.split('.');
    final extension = parts.removeLast();
    final path = parts.join('.');
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': {
        'path': path,
        'extension': extension,
      },
    };
  }

  factory ComicsResumeModel.fromJson(String source) =>
      ComicsResumeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}