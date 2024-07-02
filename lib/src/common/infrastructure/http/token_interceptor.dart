// ignore_for_file: avoid_init_to_null

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:marvel_app/src/common/configs.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.addAll({
      'ts': '1',
      'hash': AppConfigs.md5Hash,
      'apikey': AppConfigs.publicKey,
    });

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    await FirebaseCrashlytics.instance.recordError(
      err,
      err.stackTrace,
      reason: 'API Error',
      printDetails: true,
    );
    return super.onError(err, handler);
  }
}
