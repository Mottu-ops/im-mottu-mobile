import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:persistence/persistence.dart';
import 'package:mottu_marvel/modules/characters/data/repository/characters_repository_impl.dart';

import '../domain/repository/characters_repository.dart';
import '../presentation/pagers/characters_page_controller.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharactersRepository>(() => CharactersRepositoryImpl(httpClient: DioHttpClient(dio)));
    Get.put<CharactersPageController>(CharactersPageController());
    Get.put<KeyValuePersistence>(HiveKeyValuePersistence(boxName: 'cache', directory: directory));
  }
}
