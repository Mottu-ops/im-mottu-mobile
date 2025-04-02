class PokemonPreviewModel {
  final String name;
  final String imageUrl;
  final int id;

  PokemonPreviewModel(
      {required this.name, required this.imageUrl, required this.id});

  factory PokemonPreviewModel.fromJson(Map<String, dynamic> map) {
    int id = int.parse(map['url'].split('/').reversed.elementAt(1));
    return PokemonPreviewModel(
      name: map['name'],
      id: id,
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
