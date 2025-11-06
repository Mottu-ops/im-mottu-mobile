class PokemonModel {
  final String url;

  String get id {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments[segments.length - 2] : '';
  }

  const PokemonModel({required this.url});

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(url: map['url']);
  }
}
