import 'package:get/get.dart';
import 'package:im_mottu_flutter/app/modules/home/interactor/states/home_state.dart';

import '../repositories/i_home_repository.dart';

class HomeStore extends GetxController {
  HomeState state = HomeState.empty();
  final IHomeRepository homeRepository;

  HomeStore(this.homeRepository);

  Future<void> getCharacters() async {
    state = state.copyWith(status: HomeStateStatus.loading);
    update();

    final result = await homeRepository.getCharacterListData();
    if (result.$1?.data.results != null) {
      state = state.copyWith(status: HomeStateStatus.success, charactersList: result.$1?.data.results);
    } else {
      state = state.copyWith(status: HomeStateStatus.error, errorMessage: result.$2);
    }
    update();
  }
}
