import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';

class AllCharactersDataModel {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<AllCharactersResultModel>? results;
  AllCharactersDataModel({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  AllCharactersDataModel copyWith({
    ValueGetter<int?>? offset,
    ValueGetter<int?>? limit,
    ValueGetter<int?>? total,
    ValueGetter<int?>? count,
    ValueGetter<List<AllCharactersResultModel>?>? results,
  }) {
    return AllCharactersDataModel(
      offset: offset != null ? offset() : this.offset,
      limit: limit != null ? limit() : this.limit,
      total: total != null ? total() : this.total,
      count: count != null ? count() : this.count,
      results: results != null ? results() : this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCharactersDataModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersDataModel(
      offset: map['offset']?.toInt(),
      limit: map['limit']?.toInt(),
      total: map['total']?.toInt(),
      count: map['count']?.toInt(),
      results: map['results'] != null
          ? List<AllCharactersResultModel>.from(
              map['results']?.map((x) => AllCharactersResultModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersDataModel.fromJson(String source) =>
      AllCharactersDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllCharactersDataModel(offset: $offset, limit: $limit, total: $total, count: $count, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersDataModel &&
        other.offset == offset &&
        other.limit == limit &&
        other.total == total &&
        other.count == count &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return offset.hashCode ^
        limit.hashCode ^
        total.hashCode ^
        count.hashCode ^
        results.hashCode;
  }
}
