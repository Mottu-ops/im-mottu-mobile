class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final int baseExperience;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.baseExperience,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    final sprites = json['sprites'];
    if (sprites != null) {
      imageUrl = sprites['front_default'] ?? '';
    }

    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      imageUrl: imageUrl,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List<dynamic>?)
              ?.map((type) => type['type']['name'] as String)
              .toList() ??
          [],
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((ability) => ability['ability']['name'] as String)
              .toList() ??
          [],
      baseExperience: json['base_experience'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'height': height,
      'weight': weight,
      'types': types,
      'abilities': abilities,
      'base_experience': baseExperience,
    };
  }
}
