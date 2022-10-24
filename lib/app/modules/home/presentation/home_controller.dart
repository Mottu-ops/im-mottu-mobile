import 'package:marvelapp/app/core/domain/entities/char_entity.dart';
import 'package:mobx/mobx.dart';

import 'package:marvelapp/app/core/domain/enums/control_state.dart';
import 'package:marvelapp/app/core/stores/characters_store.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CharactersStore _store;
  HomeControllerBase({
    required CharactersStore store,
  }) : _store = store;

  final ControlState state = StartState();

  List<Char> get heroes => _store.characters;
}
