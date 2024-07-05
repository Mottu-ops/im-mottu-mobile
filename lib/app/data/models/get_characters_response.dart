import 'package:equatable/equatable.dart';
import 'package:mottu_marvel/app/data/models/character_model.dart';

class GetCharactersResponse extends Equatable {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<CharacterModel>? results;

  const GetCharactersResponse({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  GetCharactersResponse fromJson(Map<String, dynamic> json) {
    final results = <CharacterModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(const CharacterModel().fromJson(v));
      });
    }

    return GetCharactersResponse(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: results,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['offset'] = offset;
    data['limit'] = limit;
    data['total'] = total;
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        offset,
        limit,
        total,
        count,
        results,
      ];
}
