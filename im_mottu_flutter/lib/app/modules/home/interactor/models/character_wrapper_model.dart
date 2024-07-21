import 'dart:convert';

import 'package:im_mottu_flutter/app/modules/home/interactor/models/data_model.dart';

class CharacterDataWrapper {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final DataModel data;

  CharacterDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  CharacterDataWrapper copyWith({
    int? code,
    String? status,
    String? copyright,
    String? attributionText,
    String? attributionHtml,
    String? etag,
    DataModel? data,
  }) =>
      CharacterDataWrapper(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory CharacterDataWrapper.fromJson(String str) => CharacterDataWrapper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterDataWrapper.fromMap(Map<String, dynamic> json) => CharacterDataWrapper(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: DataModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toMap(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CharacterDataWrapper &&
      other.code == code &&
      other.status == status &&
      other.copyright == copyright &&
      other.attributionText == attributionText &&
      other.attributionHtml == attributionHtml &&
      other.etag == etag &&
      other.data == data;
  }

  @override
  int get hashCode {
    return code.hashCode ^
      status.hashCode ^
      copyright.hashCode ^
      attributionText.hashCode ^
      attributionHtml.hashCode ^
      etag.hashCode ^
      data.hashCode;
  }
}
