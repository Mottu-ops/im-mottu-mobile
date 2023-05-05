class Movies {
  Movies({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.totalResults,
    required this.public,
    required this.revenue,
    required this.page,
    required this.results,
    required this.objectIds,
    required this.iso_639_1,
    required this.totalPages,
    required this.description,
    required this.createdBy,
    required this.iso_3166_1,
    required this.averageRating,
    required this.runtime,
    required this.name,
    required this.comments,
  });
  late final String posterPath;
  late final int id;
  late final String backdropPath;
  late final int totalResults;
  late final bool public;
  late final int revenue;
  late final int page;
  late final List<Results> results;
  late final ObjectIds objectIds;
  late final String iso_639_1;
  late final int totalPages;
  late final String description;
  late final CreatedBy createdBy;
  late final String iso_3166_1;
  late final double averageRating;
  late final int runtime;
  late final String name;
  late final Comments comments;

  Movies.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    backdropPath = json['backdrop_path'];
    totalResults = json['total_results'];
    public = json['public'];
    revenue = json['revenue'];
    page = json['page'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    objectIds = ObjectIds.fromJson(json['object_ids']);
    iso_639_1 = json['iso_639_1'];
    totalPages = json['total_pages'];
    description = json['description'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    iso_3166_1 = json['iso_3166_1'];
    averageRating = json['average_rating'];
    runtime = json['runtime'];
    name = json['name'];
    comments = Comments.fromJson(json['comments']);
  }

  Movies copyWith({
    String? posterPath,
    int? id,
    String? backdropPath,
    int? totalResults,
    bool? public,
    int? revenue,
    int? page,
    List<Results>? results,
    ObjectIds? objectIds,
    String? iso_639_1,
    int? totalPages,
    String? description,
    CreatedBy? createdBy,
    String? iso_3166_1,
    double? averageRating,
    int? runtime,
    String? name,
    Comments? comments,
  }) {
    return Movies(
        posterPath: posterPath ?? this.posterPath,
        id: id ?? this.id,
        backdropPath: backdropPath ?? this.backdropPath,
        totalResults: totalResults ?? this.totalResults,
        public: public ?? this.public,
        revenue: revenue ?? this.revenue,
        page: page ?? this.page,
        results: results ?? this.results,
        objectIds: objectIds ?? this.objectIds,
        iso_639_1: iso_639_1 ?? this.iso_639_1,
        totalPages: totalPages ?? this.totalPages,
        description: description ?? this.description,
        createdBy: createdBy ?? this.createdBy,
        iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
        averageRating: averageRating ?? this.averageRating,
        runtime: runtime ?? this.runtime,
        name: name ?? this.name,
        comments: comments ?? this.comments);
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['id'] = id;
    _data['backdrop_path'] = backdropPath;
    _data['total_results'] = totalResults;
    _data['public'] = public;
    _data['revenue'] = revenue;
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['object_ids'] = objectIds.toJson();
    _data['iso_639_1'] = iso_639_1;
    _data['total_pages'] = totalPages;
    _data['description'] = description;
    _data['created_by'] = createdBy.toJson();
    _data['iso_3166_1'] = iso_3166_1;
    _data['average_rating'] = averageRating;
    _data['runtime'] = runtime;
    _data['name'] = name;
    _data['comments'] = comments.toJson();
    return _data;
  }

  @override
  String toString() {
    return 'Movies(posterPath: $posterPath, id: $id, backdropPath: $backdropPath, totalResults: $totalResults, public: $public, revenue: $revenue, page: $page, results: $results, objectIds: $objectIds, iso_639_1: $iso_639_1, totalPages: $totalPages, description: $description, createdBy: $createdBy, iso_3166_1: $iso_3166_1, averageRating: $averageRating, runtime: $runtime, name: $name, comments: $comments)';
  }
}

class Results {
  Results({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });
  late final String posterPath;
  late final bool adult;
  late final String overview;
  late final String releaseDate;
  late final String originalTitle;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String title;
  late final String backdropPath;
  late final double popularity;
  late final int voteCount;
  late final bool video;
  late final num voteAverage;

  Results copyWith({
    String? posterPath,
    bool? adult,
    String? overview,
    String? releaseDate,
    String? originalTitle,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? title,
    String? backdropPath,
    double? popularity,
    int? voteCount,
    bool? video,
    num? voteAverage,
  }) {
    return Results(
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      genreIds: genreIds ?? this.genreIds,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['adult'] = adult;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['original_title'] = originalTitle;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['original_language'] = originalLanguage;
    _data['title'] = title;
    _data['backdrop_path'] = backdropPath;
    _data['popularity'] = popularity;
    _data['vote_count'] = voteCount;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    return _data;
  }

  @override
  String toString() {
    return 'Results(posterPath: $posterPath, adult: $adult, overview: $overview, releaseDate: $releaseDate, originalTitle: $originalTitle, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, title: $title, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, voteAverage: $voteAverage)';
  }
}

class ObjectIds {
  ObjectIds({
    required this.movie100402,
    required this.movie2080,
    required this.movie76170,
    required this.movie71676,
    required this.movie1724,
    required this.movie68721,
    required this.movie49538,
    required this.movie1930,
    required this.movie10138,
    required this.movie99861,
    required this.movie1979,
    required this.movie1726,
    required this.movie118340,
    required this.movie13056,
    required this.movie76338,
    required this.movie127585,
    required this.movie102382,
    required this.movie1771,
    required this.movie10195,
    required this.movie24428,
  });
  late final String? movie100402;
  late final String? movie2080;
  late final String? movie76170;
  late final String? movie71676;
  late final String? movie1724;
  late final String? movie68721;
  late final String? movie49538;
  late final String? movie1930;
  late final String? movie10138;
  late final String? movie99861;
  late final String? movie1979;
  late final String? movie1726;
  late final String? movie118340;
  late final String? movie13056;
  late final String? movie76338;
  late final String? movie127585;
  late final String? movie102382;
  late final String? movie1771;
  late final String? movie10195;
  late final String? movie24428;

  ObjectIds.fromJson(Map<String, dynamic> json) {
    movie100402 = json['movie:100402'];
    movie2080 = json['movie:2080'];
    movie76170 = json['movie:76170'];
    movie71676 = json['movie:71676'];
    movie1724 = json['movie:1724'];
    movie68721 = json['movie:68721'];
    movie49538 = json['movie:49538'];
    movie1930 = json['movie:1930'];
    movie10138 = json['movie:10138'];
    movie99861 = json['movie:99861'];
    movie1979 = json['movie:1979'];
    movie1726 = json['movie:1726'];
    movie118340 = json['movie:118340'];
    movie13056 = json['movie:13056'];
    movie76338 = json['movie:76338'];
    movie127585 = json['movie:127585'];
    movie102382 = json['movie:102382'];
    movie1771 = json['movie:1771'];
    movie10195 = json['movie:10195'];
    movie24428 = json['movie:24428'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movie:100402'] = movie100402;
    _data['movie:2080'] = movie2080;
    _data['movie:76170'] = movie76170;
    _data['movie:71676'] = movie71676;
    _data['movie:1724'] = movie1724;
    _data['movie:68721'] = movie68721;
    _data['movie:49538'] = movie49538;
    _data['movie:1930'] = movie1930;
    _data['movie:10138'] = movie10138;
    _data['movie:99861'] = movie99861;
    _data['movie:1979'] = movie1979;
    _data['movie:1726'] = movie1726;
    _data['movie:118340'] = movie118340;
    _data['movie:13056'] = movie13056;
    _data['movie:76338'] = movie76338;
    _data['movie:127585'] = movie127585;
    _data['movie:102382'] = movie102382;
    _data['movie:1771'] = movie1771;
    _data['movie:10195'] = movie10195;
    _data['movie:24428'] = movie24428;
    return _data;
  }
}

class CreatedBy {
  CreatedBy({
    required this.gravatarHash,
    required this.name,
    required this.username,
  });
  late final String gravatarHash;
  late final String name;
  late final String username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json['gravatar_hash'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar_hash'] = gravatarHash;
    _data['name'] = name;
    _data['username'] = username;
    return _data;
  }
}

class Comments {
  Comments({
    required this.movie100402,
    required this.movie2080,
    required this.movie76170,
    required this.movie71676,
    required this.movie1724,
    required this.movie68721,
    required this.movie49538,
    required this.movie1930,
    required this.movie10138,
    required this.movie99861,
    required this.movie1979,
    required this.movie1726,
    required this.movie118340,
    required this.movie13056,
    required this.movie76338,
    required this.movie127585,
    required this.movie102382,
    required this.movie1771,
    required this.movie10195,
    required this.movie24428,
  });
  late final String? movie100402;
  late final String? movie2080;
  late final String? movie76170;
  late final String? movie71676;
  late final String? movie1724;
  late final String? movie68721;
  late final String? movie49538;
  late final String? movie1930;
  late final String? movie10138;
  late final String? movie99861;
  late final String? movie1979;
  late final String? movie1726;
  late final String? movie118340;
  late final String? movie13056;
  late final String? movie76338;
  late final String? movie127585;
  late final String? movie102382;
  late final String? movie1771;
  late final String? movie10195;
  late final String? movie24428;

  Comments.fromJson(Map<String, dynamic> json) {
    movie100402 = json['movie:100402'];
    movie2080 = json['movie:2080'];
    movie76170 = json['movie:76170'];
    movie71676 = json['movie:71676'];
    movie1724 = json['movie:1724'];
    movie68721 = json['movie:68721'];
    movie49538 = json['movie:49538'];
    movie1930 = json['movie:1930'];
    movie10138 = json['movie:10138'];
    movie99861 = json['movie:99861'];
    movie1979 = json['movie:1979'];
    movie1726 = json['movie:1726'];
    movie118340 = json['movie:118340'];
    movie13056 = json['movie:13056'];
    movie76338 = json['movie:76338'];
    movie127585 = json['movie:127585'];
    movie102382 = json['movie:102382'];
    movie1771 = json['movie:1771'];
    movie10195 = json['movie:10195'];
    movie24428 = json['movie:24428'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movie:100402'] = movie100402;
    _data['movie:2080'] = movie2080;
    _data['movie:76170'] = movie76170;
    _data['movie:71676'] = movie71676;
    _data['movie:1724'] = movie1724;
    _data['movie:68721'] = movie68721;
    _data['movie:49538'] = movie49538;
    _data['movie:1930'] = movie1930;
    _data['movie:10138'] = movie10138;
    _data['movie:99861'] = movie99861;
    _data['movie:1979'] = movie1979;
    _data['movie:1726'] = movie1726;
    _data['movie:118340'] = movie118340;
    _data['movie:13056'] = movie13056;
    _data['movie:76338'] = movie76338;
    _data['movie:127585'] = movie127585;
    _data['movie:102382'] = movie102382;
    _data['movie:1771'] = movie1771;
    _data['movie:10195'] = movie10195;
    _data['movie:24428'] = movie24428;
    return _data;
  }
}
