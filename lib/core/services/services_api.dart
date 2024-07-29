import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:im_mottu_mobile/core/components/snackbar/snackbar.dart';
import 'package:im_mottu_mobile/core/util/url.dart';

class ServicesApi {
  final dio.Dio _dio = dio.Dio();
  final String baseUrl = AppApiUrl().baseUrlApp;
  final String apiKey = AppApiUrl().apiKey;
  final String privateKey = AppApiUrl().privateKey;

  ServicesApi() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(minutes: 1);
    _dio.options.receiveTimeout = const Duration(minutes: 1);
  }

  String _generateHash(String timestamp) {
    var bytes =
        utf8.encode('$timestamp$privateKey$apiKey'); // data being hashed
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  Future<dynamic> getRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timestamp);
    final queryParams = {
      'ts': timestamp,
      'apikey': apiKey,
      'hash': hash,
      ...?params
    };

    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      log('Response URL: ${response.realUri}');
      log('Response Body: ${response.data}');

      return _processResponse(response);
    } on dio.DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timestamp);
    final queryParams = {'ts': timestamp, 'apikey': apiKey, 'hash': hash};

    try {
      final response = await _dio.post(
        endpoint,
        queryParameters: queryParams,
        data: jsonEncode(data),
        options: dio.Options(headers: {'Content-Type': 'application/json'}),
      );
      log('Response URL: ${response.realUri}');
      log('Response Body: ${response.data}');

      return _processResponse(response);
    } on dio.DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  dynamic _processResponse(dio.Response response) {
    if (response.statusCode == 200) {
      var body = response.data;
      return body['data'];
    } else {
      AppSnackBar.error(messageText: 'Erro de rede: ${response.statusCode}');
      return null;
    }
  }

  void _handleError(dio.DioException error) {
    if (error.response != null) {
      log('Erro na resposta: ${error.response?.data}');
      AppSnackBar.error(
          messageText: 'Erro de rede: ${error.response?.statusCode}');
    } else {
      log('Erro na solicitação: $error');
      AppSnackBar.error(messageText: 'Erro de rede: ${error.message}');
    }
  }
}
