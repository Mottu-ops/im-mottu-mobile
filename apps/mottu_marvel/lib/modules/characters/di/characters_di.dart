import 'package:analytics/analytics.dart';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_details_page_controller.dart';
import 'package:persistence/persistence.dart';
import 'package:mottu_marvel/modules/characters/data/repository/characters_repository_impl.dart';

import '../domain/repository/characters_repository.dart';
import '../presentation/pages/characters_page_controller.dart';

class CharactersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KeyValuePersistence>(
      HiveKeyValuePersistence(boxName: 'cache', directory: directory),
    );

    Get.put<AnalyticsService>(AnalyticsFirebaseService());

    Get.lazyPut<CharactersRepository>(() => CharactersRepositoryImpl(
          httpClient: DioHttpClient(
            dio,
            dioCacheInterceptor: DioCacheInterceptor(
              persistence: Get.find<KeyValuePersistence>(),
              analytics: Get.find<AnalyticsService>(),
            ),
          ),
          analytics: Get.find<AnalyticsService>(),
        ));

    Get.lazyPut<CharactersPageController>(() => CharactersPageController());
    Get.create<CharactersDetailsPageController>(() => CharactersDetailsPageController());
  }
}
