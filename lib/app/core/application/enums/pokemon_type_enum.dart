enum PokemonTypeEnum {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  stellar,
  unknown;

  static PokemonTypeEnum fromJson(Map<String, dynamic> json) {
    return PokemonTypeEnum.values.firstWhere(
      (type) => type.name == json['type']['name'],
      orElse: () => PokemonTypeEnum.unknown,
    );
  }
}
