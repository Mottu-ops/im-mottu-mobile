import 'package:dio/dio.dart';
import 'package:marvel_app/src/shared/http/marvel_exception.dart';
import 'package:marvel_app/src/shared/http/marvel_request.dart';
import 'package:marvel_app/src/shared/http/marvel_response.dart';

class MarvelHttpClient {
  final Dio dio;

  MarvelHttpClient({required this.dio});

  Future<bool> checkPinning(DioException error,
      {String url = '', Map<String, dynamic>? queryParameters}) async {
    bool secure = false;
    if (!(error.message ?? '').contains('CERTIFICATE_VERIFY_FAILED')) {
      secure = true;
    }
    return secure;
  }

  Future<MarvelResponse> request(IMarvelRequest request) async {
    try {
      final Response<dynamic> response = await dio.request(
        request.path,
        data: request.body,
        queryParameters: request.queryParams,
        options: Options(
          method: request.method.toString(),
          headers: request.headers,
        ),
      );
      // final Map<String, dynamic> body = {
      //   if (response.data is String) ...{
      //     'body': response.data,
      //   } else if (response.data is Map<String, dynamic>) ...{
      //     ...response.data,
      //   }
      // };

      if (response.statusCode != null) {
        return MarvelResponse(
          response.statusCode ?? 989,
          response.statusMessage ?? 'SUCESSO',
          response.data,
          response.headers.map.map((String key, List<String> value) =>
              MapEntry<String, dynamic>(key, value.join(','))),
        );
      } else {
        return MarvelResponse(
          response.statusCode ?? 989,
          response.statusMessage ?? 'ERRO AO RECEBER MSG',
          response.data,
          response.headers.map.map((String key, List<String> value) =>
              MapEntry<String, dynamic>(key, value.join(','))),
        );
      }
    } on MarvelHttpException catch (e) {
      throw MarvelHttpException(e.statusCode, e.statusMessage, e.data);
    } on DioException catch (e) {
      if (!await checkPinning(e)) {
        throw MarvelHttpException(999, 'Sem conexão', {
          'messageError': 'Conexão instável. Verifique sua rede de internet.'
        });
      } else if (e.response?.statusCode != null) {
        return MarvelResponse(
          e.response?.statusCode ?? 989,
          e.response?.statusMessage ?? 'ERRO AO RECEBER MSG',
          e.response?.data,
          {
            if (!(e.response?.headers.isEmpty ?? true)) ...{
              ...e.response?.headers.map.map((String key, List<String> value) =>
                      MapEntry<String, dynamic>(key, value.join(','))) ??
                  {},
            },
          },
        );
      } else {
        throw MarvelHttpException(
          e.response?.statusCode ?? 989,
          e.message ?? 'ERRO AO RECEBER MSG',
          {
            if (e.error != null) ...{
              'error': e.error,
              'stacktrace': e.stackTrace,
            },
            if (e.response?.data is String) ...{
              'body': e.response?.data,
            },
            if (e.response?.data is Map<String, dynamic>) ...{
              ...e.response?.data,
            }
          },
        );
      }
    } catch (e) {
      throw MarvelHttpException(
        989,
        'ERRO AO RECEBER MSG',
        {
          'messageError': e.toString(),
        },
      );
    }
  }
}