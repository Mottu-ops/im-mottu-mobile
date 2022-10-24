import 'package:mobx/mobx.dart';

import '../domain/entities/char_entity.dart';


class CharactersStore {
  List<Char> characters = [];

  void setCharacters(List<Char> heroes) => characters = heroes;
}
