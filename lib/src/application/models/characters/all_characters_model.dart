import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_data/all_characters_data_model.dart';

class AllCharactersModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final String? etag;
  final List<AllCharactersDataModel>? data;
  AllCharactersModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  });

  AllCharactersModel copyWith({
    ValueGetter<int?>? code,
    ValueGetter<String?>? status,
    ValueGetter<String?>? copyright,
    ValueGetter<String?>? attributionText,
    ValueGetter<String?>? attributionHTML,
    ValueGetter<String?>? etag,
    ValueGetter<List<AllCharactersDataModel>?>? data,
  }) {
    return AllCharactersModel(
      code: code != null ? code() : this.code,
      status: status != null ? status() : this.status,
      copyright: copyright != null ? copyright() : this.copyright,
      attributionText:
          attributionText != null ? attributionText() : this.attributionText,
      attributionHTML:
          attributionHTML != null ? attributionHTML() : this.attributionHTML,
      etag: etag != null ? etag() : this.etag,
      data: data != null ? data() : this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'etag': etag,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCharactersModel.fromMap(Map<String, dynamic> map) {
    return AllCharactersModel(
      code: map['code']?.toInt(),
      status: map['status'],
      copyright: map['copyright'],
      attributionText: map['attributionText'],
      attributionHTML: map['attributionHTML'],
      etag: map['etag'],
      data: map['data'] != null
          ? List<AllCharactersDataModel>.from(
              map['data']?.map((x) => AllCharactersDataModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCharactersModel.fromJson(String source) =>
      AllCharactersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllCharactersModel(code: $code, status: $status, copyright: $copyright, attributionText: $attributionText, attributionHTML: $attributionHTML, etag: $etag, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCharactersModel &&
        other.code == code &&
        other.status == status &&
        other.copyright == copyright &&
        other.attributionText == attributionText &&
        other.attributionHTML == attributionHTML &&
        other.etag == etag &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return code.hashCode ^
        status.hashCode ^
        copyright.hashCode ^
        attributionText.hashCode ^
        attributionHTML.hashCode ^
        etag.hashCode ^
        data.hashCode;
  }
}
