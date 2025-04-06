import 'dart:ui';

import 'package:pokedex/app/core/application/theme/palettes.dart';

enum PokemonTypeEnum {
  normal(Palettes.normalColor),
  fighting(Palettes.fightingColor),
  flying(Palettes.flyingColor),
  poison(Palettes.poisonColor),
  ground(Palettes.groundColor),
  rock(Palettes.rockColor),
  bug(Palettes.bugColor),
  ghost(Palettes.ghostColor),
  steel(Palettes.steelColor),
  fire(Palettes.fireColor),
  water(Palettes.waterColor),
  grass(Palettes.grassColor),
  electric(Palettes.electricColor),
  psychic(Palettes.psychicColor),
  ice(Palettes.iceColor),
  dragon(Palettes.dragonColor),
  dark(Palettes.darkColor),
  fairy(Palettes.fairyColor),
  stellar(Palettes.stellarColor),
  unknown(Palettes.unknownColor);

  final Color color;
  const PokemonTypeEnum(this.color);

  static PokemonTypeEnum fromJson(Map<String, dynamic> json) {
    return PokemonTypeEnum.values.firstWhere(
      (type) => type.name == json['type']['name'],
      orElse: () => PokemonTypeEnum.unknown,
    );
  }
}
