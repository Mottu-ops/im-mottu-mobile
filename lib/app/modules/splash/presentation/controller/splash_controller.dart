import 'package:marvelapp/app/core/domain/enums/control_state.dart';
import 'package:marvelapp/app/core/stores/characters_store.dart';
import 'package:marvelapp/app/core/usecases/get_heroes_from_server_usecase.dart';
import 'package:marvelapp/app/core/usecases/i_usecase.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final CharactersStore _store;
  final GetHeroesFromServerUsecase _getHeroesFromServerUsecase;

  SplashControllerBase({
    required GetHeroesFromServerUsecase getHeroesFromServerUsecase,
    required CharactersStore store,
  })  : _store = store,
        _getHeroesFromServerUsecase = getHeroesFromServerUsecase;

  @observable
  ControlState state = StartState();

  @action
  void setState(ControlState nextState) => state = nextState;

  void pipeline() async {
    setState(LoadingState());
    final result = await _getHeroesFromServerUsecase(const NoParams());
    result.fold(
      (failure) {
        state = ErrorState();
      },
      (heroes) {
        _store.setCharacters(heroes);
        setState(SuccessState());
      },
    );
  }
}
