import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/application/pages/characters/characters_controller.dart';
import 'package:mottu_marvel/src/repositories/characters/characters_repository.dart';
import 'package:mottu_marvel/src/repositories/characters/characters_repository_impl.dart';
import 'package:mottu_marvel/src/rest_client/custom_dio.dart';
import 'package:mottu_marvel/src/services/characters/characters_service.dart';
import 'package:mottu_marvel/src/services/characters/characters_service_impl.dart';

class CharactersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomDio>(
      () => CustomDio(),
    );
    Get.lazyPut<FirebaseClass>(
      () => FirebaseClass(),
    );
    Get.lazyPut<CharactersRepository>(
      () => CharactersRepositoryImpl(
        dio: Get.find(),
        firebaseClass: Get.find(),
      ),
    );
    Get.lazyPut<CharactersService>(
      () => CharactersServiceImpl(
        charactersRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => CharactersController(
        charactersService: Get.find(),
      ),
    );
  }
}
