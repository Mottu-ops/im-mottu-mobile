import 'dart:convert';

import 'result_character.dart';

class DataModel {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<ResultCharacter> results;

  DataModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  DataModel copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<ResultCharacter>? results,
  }) =>
      DataModel(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<ResultCharacter>.from(json["results"].map((x) => ResultCharacter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
