import 'package:get/state_manager.dart';
import 'package:mottu_test/core/decorators/movies_cache_repo_decorator.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/repositories/movies_repository_imp.dart';
import 'package:mottu_test/core/services/dio_service_imp.dart';
import 'package:mottu_test/modules/home/helper/model_helper.dart';

class HomeGetx extends GetxController {
  Rx<int> selectIndex = 0.obs;

  final repo = MoviesCacheRepoDecorator(MoveisImpRepo(DioServicesImp()));
  Rx<Marvel> movies = MarvelHelper.emptyEntity().obs;
  Marvel? _cachedMovie;

  fetchData() async {
    final result = await repo.getMovie();
    movies.value = result;
    _cachedMovie = movies.value;
    update();
  }

  updateIndex(index) {
    selectIndex.value = index;
    update();
  }
}
