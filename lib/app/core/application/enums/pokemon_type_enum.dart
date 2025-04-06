import 'dart:ui';

import 'package:pokedex/app/core/application/theme/palettes.dart';

enum PokemonTypeEnum {
  normal(Palettes.normalColor, 'assets/icons/normal_icon.svg', 'Normal'),
  fighting(Palettes.fightingColor, 'assets/icons/fighting_icon.svg', 'Lutador'),
  flying(Palettes.flyingColor, 'assets/icons/flying_icon.svg', 'Voador'),
  poison(Palettes.poisonColor, 'assets/icons/poison_icon.svg', 'Venenoso'),
  ground(Palettes.groundColor, 'assets/icons/ground_icon.svg', 'Terra'),
  rock(Palettes.rockColor, 'assets/icons/rock_icon.svg', 'Pedra'),
  bug(Palettes.bugColor, 'assets/icons/bug_icon.svg', 'Inseto'),
  ghost(Palettes.ghostColor, 'assets/icons/ghost_icon.svg', 'Fantasma'),
  steel(Palettes.steelColor, 'assets/icons/steel_icon.svg', 'Aço'),
  fire(Palettes.fireColor, 'assets/icons/fire_icon.svg', 'Fogo'),
  water(Palettes.waterColor, 'assets/icons/water_icon.svg', 'Água'),
  grass(Palettes.grassColor, 'assets/icons/grass_icon.svg', 'Planta'),
  electric(
      Palettes.electricColor, 'assets/icons/electric_icon.svg', 'Elétrico'),
  psychic(Palettes.psychicColor, 'assets/icons/psychic_icon.svg', 'Psíquico'),
  ice(Palettes.iceColor, 'assets/icons/ice_icon.svg', 'Gelo'),
  dragon(Palettes.dragonColor, 'assets/icons/dragon_icon.svg', 'Dragão'),
  dark(Palettes.darkColor, 'assets/icons/dark_icon.svg', 'Sombrio'),
  fairy(Palettes.fairyColor, 'assets/icons/fairy_icon.svg', 'Fada'),
  stellar(Palettes.stellarColor, 'assets/icons/fire_icon.svg', 'Fogo'),
  unknown(Palettes.unknownColor, null, 'Desconhecido');

  final Color color;
  final String typeName;
  final String? iconPath;
  const PokemonTypeEnum(this.color, this.iconPath, this.typeName);

  static PokemonTypeEnum fromJson(Map<String, dynamic> json) {
    return PokemonTypeEnum.values.firstWhere(
      (type) => type.name == json['type']['name'],
      orElse: () => PokemonTypeEnum.unknown,
    );
  }
}
