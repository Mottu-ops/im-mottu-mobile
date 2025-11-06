abstract interface class HttpClientService {
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });
}
