import 'dart:convert';

enum UrlType { COMICLINK, DETAIL, WIKI }

final urlTypeValues = EnumValues({"comiclink": UrlType.COMICLINK, "detail": UrlType.DETAIL, "wiki": UrlType.WIKI});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class Url {
  final UrlType type;
  final String url;

  Url({
    required this.type,
    required this.url,
  });

  Url copyWith({
    UrlType? type,
    String? url,
  }) =>
      Url(
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": urlTypeValues.reverse[type],
        "url": url,
      };
}
