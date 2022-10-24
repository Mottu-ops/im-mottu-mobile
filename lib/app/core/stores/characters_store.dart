import 'package:mobx/mobx.dart';

import '../domain/char_entity.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  List<Char> characters = [];
}
