part of 'model.dart';
class CharactersResult {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final CharactersResultData data;

  CharactersResult({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  CharactersResult copyWith({
    int? code,
    String? status,
    String? copyright,
    String? attributionText,
    String? attributionHtml,
    String? etag,
    CharactersResultData? data,
  }) =>
      CharactersResult(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory CharactersResult.fromJson(Map<String, dynamic> json) =>
      CharactersResult(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: CharactersResultData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toJson(),
      };
}

class CharactersResultData {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<CharacterData> results;

  CharactersResultData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  CharactersResultData copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<CharacterData>? results,
  }) =>
      CharactersResultData(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory CharactersResultData.fromJson(Map<String, dynamic> json) =>
      CharactersResultData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<CharacterData>.from(
            json["results"].map((x) => CharacterData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class CharacterData {
  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Comics comics;
  final Series series;
  final Stories stories;
  final Events events;
  final List<Url> urls;

  CharacterData({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  CharacterData copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    Thumbnail? thumbnail,
    String? resourceUri,
    Comics? comics,
    Series? series,
    Stories? stories,
    Events? events,
    List<Url>? urls,
  }) =>
      CharacterData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        resourceUri: resourceUri ?? this.resourceUri,
        comics: comics ?? this.comics,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        events: events ?? this.events,
        urls: urls ?? this.urls,
      );

  factory CharacterData.fromJson(Map<String, dynamic> json) => CharacterData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromJson(json["comics"]),
        series: Series.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Events.fromJson(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        "comics": comics.toJson(),
        "series": series.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
      };
}

class Series extends Comics {
  Series({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items: List<ComicsItem>.from(
            json["items"]?.map((x) => ComicsItem.fromJson(x)) ?? []),
        returned: json["returned"] ?? 0,
      );
}

class Events extends Comics {
  Events({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });
  factory Events.fromJson(Map<String, dynamic> json) => Events(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );
}


class Creators {
    final int available;
    final String collectionUri;
    final List<CreatorsItem> items;
    final int returned;

    Creators({
        required this.available,
        required this.collectionUri,
        required this.items,
        required this.returned,
    });

    Creators copyWith({
        int? available,
        String? collectionUri,
        List<CreatorsItem>? items,
        int? returned,
    }) => 
        Creators(
            available: available ?? this.available,
            collectionUri: collectionUri ?? this.collectionUri,
            items: items ?? this.items,
            returned: returned ?? this.returned,
        );

    factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class CreatorsItem {
    final String resourceUri;
    final String name;
    final String role;

    CreatorsItem({
        required this.resourceUri,
        required this.name,
        required this.role,
    });

    CreatorsItem copyWith({
        String? resourceUri,
        String? name,
        String? role,
    }) => 
        CreatorsItem(
            resourceUri: resourceUri ?? this.resourceUri,
            name: name ?? this.name,
            role: role ?? this.role,
        );

    factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
    };
}
class Price {
    final String type;
    final double price;

    Price({
        required this.type,
        required this.price,
    });

    Price copyWith({
        String? type,
        double? price,
    }) => 
        Price(
            type: type ?? this.type,
            price: price ?? this.price,
        );

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
    };
}


class Date {
    final String type;
    final String date;

    Date({
        required this.type,
        required this.date,
    });

    Date copyWith({
        String? type,
        String? date,
    }) => 
        Date(
            type: type ?? this.type,
            date: date ?? this.date,
        );

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
    };
}

class TextObject {
    final String type;
    final String language;
    final String text;

    TextObject({
        required this.type,
        required this.language,
        required this.text,
    });

    TextObject copyWith({
        String? type,
        String? language,
        String? text,
    }) => 
        TextObject(
            type: type ?? this.type,
            language: language ?? this.language,
            text: text ?? this.text,
        );

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "language": language,
        "text": text,
    };
}



class Stories {
  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  Stories copyWith({
    int? available,
    String? collectionUri,
    List<StoriesItem>? items,
    int? returned,
  }) =>
      Stories(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class StoriesItem {
  final String resourceUri;
  final String name;
  final String type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  StoriesItem copyWith({
    String? resourceUri,
    String? name,
    String? type,
  }) =>
      StoriesItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  @override
  String toString() {
    return '$path.$extension';
  }

  Thumbnail copyWith({
    String? path,
    String? extension,
  }) =>
      Thumbnail(
        path: path ?? this.path,
        extension: extension ?? this.extension,
      );

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  final String type;
  final String url;

  Url({
    required this.type,
    required this.url,
  });

  Url copyWith({
    String? type,
    String? url,
  }) =>
      Url(
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}