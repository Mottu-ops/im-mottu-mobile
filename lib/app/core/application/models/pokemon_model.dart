class PokemonModel {
  final int id;
  final int weight;
  final int height;
  final String name;
  final String? imageUrl;
  final String? gifUrl;
  final String? criesUrl;

  PokemonModel({
    required this.id,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.name,
    required this.gifUrl,
    required this.criesUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      weight: json['weight'],
      height: json['height'],
      id: json['id'],
      criesUrl: json['cries']?['latest'],
      imageUrl: json['sprites']?['front_default'],
      gifUrl: json['sprites']?['other']?['showdown']?['front_default'],
    );
  }
}
