import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:mottu_http/src/dio_http_client.dart';
import 'package:mottu_http/src/exceptions.dart';
import 'package:mottu_http/src/mottu_http_client.dart';
import 'package:persistence/persistence.dart';

class MockDioClient extends Mock implements Dio {}

class MockResponse extends Mock implements ApiResponse {}

class MockDioError extends Mock implements DioException {}

class MockKeyValuePersistence extends Mock implements KeyValuePersistence {}

class MockDioCacheInterceptors extends Mock implements Interceptors {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockDirectory extends Mock implements Directory {}

void main() {
  late MockDioClient mockDioClient;
  late DioHttpClient dioHttpClient;
  late MockKeyValuePersistence persistence;
  late MockDioCacheInterceptors mockInterceptors;

  setUp(() {
    mockDioClient = MockDioClient();
    persistence = MockKeyValuePersistence();
    mockInterceptors = MockDioCacheInterceptors();

    when(() => mockDioClient.interceptors).thenReturn(mockInterceptors);

    dioHttpClient = DioHttpClient(mockDioClient,
        dioCacheInterceptor: DioCacheInterceptor(persistence: persistence, analytics: MockAnalyticsService()));
  });

  test('Given a GET request, when the adapter requests a URL, then return an ApiResponse', () async {
    when(() => mockDioClient.get<Map<String, dynamic>>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          requestOptions: RequestOptions(path: 'mottu.com.br'),
          data: {},
          statusCode: 200,
        ));

    final response = await dioHttpClient.get('mottu.com.br', queryParameters: {'query': '1'});

    expect(response, isA<ApiResponse>());
  });

  test('GIVEN a DioException WHEN a GET request fails THEN it should throw MottuHttpException', () async {
    final mockDioError = DioException(
      requestOptions: RequestOptions(path: 'mottu.com.br'),
      response: Response(
        requestOptions: RequestOptions(path: 'mottu.com.br'),
        data: {'message': 'Not Found'},
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
      type: DioExceptionType.badResponse,
    );

    when(() => mockDioClient.get<Map<String, dynamic>>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        )).thenThrow(mockDioError);

    expect(
      () async => await dioHttpClient.get('mottu.com.br'),
      throwsA(isA<MottuHttpException>()
          .having((e) => e.code, 'code', 404)
          .having((e) => e.httpErrorMessage, 'message', 'Not Found')
          .having((e) => e.data, 'data', {'message': 'Not Found'})),
    );
  });
}
