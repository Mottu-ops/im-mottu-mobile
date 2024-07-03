abstract class IMarvelRequest {
  MarvelHttpMethod get method => MarvelHttpMethod.get;
  String get path;
  Map<String, dynamic> get headers => {};
  dynamic get body => {};
  Map<String, String> get queryParams => {};
}

enum MarvelHttpMethod {
  get,
  post;

  @override
  String toString() {
    return name.toLowerCase();
  }
}
