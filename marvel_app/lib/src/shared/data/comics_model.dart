part of 'model.dart';

class Comics {
  final int available;
  final String collectionUri;
  final List<ComicsItem> items;
  final int returned;

  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  Comics copyWith({
    int? available,
    String? collectionUri,
    List<ComicsItem>? items,
    int? returned,
  }) =>
      Comics(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class ComicsItem {
  final int? id;
  final int? digitalId;
  final String? title;
  final String name;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<dynamic>? variants;
  final List<dynamic>? collections;
  final List<dynamic>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Creators? creators;
  // final Characters characters;
  // final Stories stories;
  // final Characters events;

  ComicsItem({
    this.id,
    this.digitalId,
    this.title,
    this.name = '',
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    required this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    //  this.characters,
    // required this.stories,
    // required this.events,
  });

  ComicsItem copyWith({
    int? id,
    int? digitalId,
    String? title,
    String? name,
    int? issueNumber,
    String? variantDescription,
    String? description,
    String? modified,
    String? isbn,
    String? upc,
    String? diamondCode,
    String? ean,
    String? issn,
    String? format,
    int? pageCount,
    List<TextObject>? textObjects,
    String? resourceUri,
    List<Url>? urls,
    Series? series,
    List<dynamic>? variants,
    List<dynamic>? collections,
    List<dynamic>? collectedIssues,
    List<Date>? dates,
    List<Price>? prices,
    Thumbnail? thumbnail,
    List<Thumbnail>? images,
    Creators? creators,
    // Characters? characters,
    // Stories? stories,
    // Characters? events,
  }) =>
      ComicsItem(
        id: id ?? this.id,
        digitalId: digitalId ?? this.digitalId,
        title: title ?? this.title,
        name: name ?? this.name,
        issueNumber: issueNumber ?? this.issueNumber,
        variantDescription: variantDescription ?? this.variantDescription,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        isbn: isbn ?? this.isbn,
        upc: upc ?? this.upc,
        diamondCode: diamondCode ?? this.diamondCode,
        ean: ean ?? this.ean,
        issn: issn ?? this.issn,
        format: format ?? this.format,
        pageCount: pageCount ?? this.pageCount,
        textObjects: textObjects ?? this.textObjects,
        resourceUri: resourceUri ?? this.resourceUri,
        urls: urls ?? this.urls,
        series: series ?? this.series,
        variants: variants ?? this.variants,
        collections: collections ?? this.collections,
        collectedIssues: collectedIssues ?? this.collectedIssues,
        dates: dates ?? this.dates,
        prices: prices ?? this.prices,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
        creators: creators ?? this.creators,
        // characters: characters ?? this.characters,
        // stories: stories ?? this.stories,
        // events: events ?? this.events,
      );

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"] ?? json["name"] ?? '',
        name: json["name"] ?? json["title"] ?? '',
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(
            json["textObjects"]?.map((x) => TextObject.fromJson(x)) ?? []),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"]?.map((x) => Url.fromJson(x)) ?? []),
        series: Series.fromJson(json["series"] ?? {}),
        variants: List<dynamic>.from(json["variants"]?.map((x) => x) ?? []),
        collections:
            List<dynamic>.from(json["collections"]?.map((x) => x) ?? []),
        collectedIssues:
            List<dynamic>.from(json["collectedIssues"]?.map((x) => x) ?? []),
        dates:
            List<Date>.from(json["dates"]?.map((x) => Date.fromJson(x)) ?? []),
        prices: List<Price>.from(
            json["prices"]?.map((x) => Price.fromJson(x)) ?? []),
        thumbnail: (json["thumbnail"] !=null) ? Thumbnail.fromJson(json["thumbnail"] ?? {}) : null,
        images: List<Thumbnail>.from(
            json["images"]?.map((x) => Thumbnail.fromJson(x)) ?? []),
        creators: (json["creators"] !=null) ? Creators.fromJson(json["creators"] ?? {}) : null,
        // characters: CharacterData.fromJson(json["characters"]),
        // stories: Stories.fromJson(json["stories"]),
        // events: Characters.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "name": name,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects":
            List<dynamic>.from(textObjects?.map((x) => x.toJson()) ?? []),
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls?.map((x) => x.toJson()) ?? []),
        "series": series?.toJson(),
        "variants": List<dynamic>.from(variants?.map((x) => x) ?? []),
        "collections": List<dynamic>.from(collections?.map((x) => x) ?? []),
        "collectedIssues":
            List<dynamic>.from(collectedIssues?.map((x) => x) ?? []),
        "dates": List<dynamic>.from(dates?.map((x) => x.toJson()) ?? []),
        "prices": List<dynamic>.from(prices?.map((x) => x.toJson()) ?? []),
        "thumbnail": thumbnail?.toJson(),
        "images": List<dynamic>.from(images?.map((x) => x.toJson()) ?? []),
        "creators": creators?.toJson(),
        // "characters": characters.toJson(),
        // "stories": stories.toJson(),
        // "events": events.toJson(),
      };
}