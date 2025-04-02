import 'http_response.dart';

abstract class IHttpClientAdapter {
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
