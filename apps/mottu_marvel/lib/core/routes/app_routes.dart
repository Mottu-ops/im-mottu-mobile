import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/router/routes.dart';

import '../../modules/splash/presentation/routes/routes.dart';

final marvelPages = <GetPage<dynamic>>[
  ...CharactersPagesRoutes.routes,
  ...SplashPagesRoutes.routes,
];
