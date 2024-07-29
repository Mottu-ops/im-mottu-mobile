class CharacterDetailModel {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final List<ComicSummary> comics;
  final List<EventSummary> events;
  final List<SeriesSummary> series;
  final List<StorySummary> stories;

  CharacterDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
    required this.events,
    required this.series,
    required this.stories,
  });

  factory CharacterDetailModel.fromMap(Map<String, dynamic> map) {
    return CharacterDetailModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? '',
      thumbnail: "${map['thumbnail']['path']}.${map['thumbnail']['extension']}",
      comics: List<ComicSummary>.from(
          (map['comics']['items'] as List).map((item) => ComicSummary.fromMap(item as Map<String, dynamic>))),
      events: List<EventSummary>.from(
          (map['events']['items'] as List).map((item) => EventSummary.fromMap(item as Map<String, dynamic>))),
      series: List<SeriesSummary>.from(
          (map['series']['items'] as List).map((item) => SeriesSummary.fromMap(item as Map<String, dynamic>))),
      stories: List<StorySummary>.from(
          (map['stories']['items'] as List).map((item) => StorySummary.fromMap(item as Map<String, dynamic>))),
    );
  }
}

class ComicSummary {
  final String resourceURI;
  final String name;

  ComicSummary({required this.resourceURI, required this.name});

  factory ComicSummary.fromMap(Map<String, dynamic> map) {
    return ComicSummary(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}



class EventSummary {
  final String resourceURI;
  final String name;

  EventSummary({required this.resourceURI, required this.name});

  factory EventSummary.fromMap(Map<String, dynamic> map) {
    return EventSummary(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}

class SeriesSummary {
  final String resourceURI;
  final String name;

  SeriesSummary({required this.resourceURI, required this.name});

  factory SeriesSummary.fromMap(Map<String, dynamic> map) {
    return SeriesSummary(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}

class StorySummary {
  final String resourceURI;
  final String name;

  StorySummary({required this.resourceURI, required this.name});

  factory StorySummary.fromMap(Map<String, dynamic> map) {
    return StorySummary(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}