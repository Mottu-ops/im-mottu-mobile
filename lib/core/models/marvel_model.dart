class Marvel {
  Marvel({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });
  late final int code;
  late final String status;
  late final String copyright;
  late final String attributionText;
  late final String attributionHTML;
  late final DataMarvel data;
  late final String etag;

  Marvel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    data = DataMarvel.fromJson(json['data']);
    etag = json['etag'];
  }

  Marvel copyWith({
    final int? code,
    final String? status,
    final String? copyright,
    final String? attributionText,
    final String? attributionHTML,
    final DataMarvel? data,
    final String? etag,
  }) {
    return Marvel(
      attributionHTML: attributionHTML ?? this.attributionHTML,
      attributionText: attributionText ?? this.attributionText,
      code: code ?? this.code,
      copyright: copyright ?? this.copyright,
      data: data ?? this.data,
      etag: etag ?? this.etag,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'Marvel(attributionHTML:$attributionHTML,attributionText:$attributionText, code:$code, copyright:$copyright, data:$data , etag:$etag, status:$status)';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    _data['copyright'] = copyright;
    _data['attributionText'] = attributionText;
    _data['attributionHTML'] = attributionHTML;
    _data['data'] = data.toJson();
    _data['etag'] = etag;
    return _data;
  }
}

class DataMarvel {
  DataMarvel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });
  late final int offset;
  late final int limit;
  late final int total;
  late final int count;
  late final List<Results> results;

  DataMarvel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  DataMarvel copyWith({
    final int? offset,
    final int? limit,
    final int? total,
    final int? count,
    final List<Results>? results,
  }) {
    return DataMarvel(
      offset: offset ?? this.offset,
      count: count ?? this.count,
      limit: limit ?? this.limit,
      results: results ?? this.results,
      total: total ?? this.total,
    );
  }

  @override
  String toString() {
    return 'DataMarvel(offset:$offset,limit:$limit, total:$total, count:$count, results:$results )';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['offset'] = offset;
    _data['limit'] = limit;
    _data['total'] = total;
    _data['count'] = count;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String modified;
  late final String resourceURI;
  late final List<Urls> urls;
  late final Thumbnail thumbnail;
  late final Comics comics;
  late final Stories stories;
  late final Events events;
  late final Series series;

  @override
  String toString() {
    return 'Results(id:$id, name:$name,description:$description,modified:$modified, resourceURI:$resourceURI,urls:$urls,  thumbnail: $thumbnail,comics:$comics, stories:$stories, events:$events,series:$series)';
  }

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    resourceURI = json['resourceURI'];
    urls = List.from(json['urls']).map((e) => Urls.fromJson(e)).toList();
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    comics = Comics.fromJson(json['comics']);
    stories = Stories.fromJson(json['stories']);
    events = Events.fromJson(json['events']);
    series = Series.fromJson(json['series']);
  }
  Results copyWith({
    final int? id,
    final String? name,
    final String? description,
    final String? modified,
    final String? resourceURI,
    final List<Urls>? urls,
    final Thumbnail? thumbnail,
    final Comics? comics,
    final Stories? stories,
    final Events? events,
    final Series? series,
  }) {
    return Results(
        comics: comics ?? this.comics,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        events: events ?? this.events,
        modified: modified ?? this.modified,
        resourceURI: resourceURI ?? this.resourceURI,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        thumbnail: thumbnail ?? this.thumbnail,
        urls: urls ?? this.urls);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['modified'] = modified;
    _data['resourceURI'] = resourceURI;
    _data['urls'] = urls.map((e) => e.toJson()).toList();
    _data['thumbnail'] = thumbnail.toJson();
    _data['comics'] = comics.toJson();
    _data['stories'] = stories.toJson();
    _data['events'] = events.toJson();
    _data['series'] = series.toJson();
    return _data;
  }
}

class Urls {
  Urls({
    required this.type,
    required this.url,
  });
  late final String type;
  late final String url;

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['url'] = url;
    return _data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });
  late final String path;
  late final String extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['extension'] = extension;
    return _data;
  }
}

class Comics {
  Comics({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final int available;
  late final int returned;
  late final String collectionURI;
  late final List<Items> items;

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.resourceURI,
    required this.name,
  });
  late final String resourceURI;
  late final String name;

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resourceURI'] = resourceURI;
    _data['name'] = name;
    return _data;
  }
}

class Stories {
  Stories({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final int available;
  late final int returned;
  late final String collectionURI;
  late final List<Items> items;

  Stories.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Events {
  Events({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final int available;
  late final int returned;
  late final String collectionURI;
  late final List<Items> items;

  Events.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Series {
  Series({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
  late final int available;
  late final int returned;
  late final String collectionURI;
  late final List<Items> items;

  Series.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available'] = available;
    _data['returned'] = returned;
    _data['collectionURI'] = collectionURI;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}
