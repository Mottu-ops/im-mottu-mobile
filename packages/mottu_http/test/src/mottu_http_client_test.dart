import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mottu_http/src/dio_http_client.dart';
import 'package:mottu_http/src/exceptions.dart';
import 'package:mottu_http/src/mottu_http_client.dart';

class MockDioClient extends Mock implements Dio {}

class MockResponse extends Mock implements ApiResponse {}

class MockDioError extends Mock implements DioException {}

void main() {
  late MockDioClient mockDioClient;
  late DioHttpClient dioHttpClient;

  setUp(() {
    mockDioClient = MockDioClient();
    dioHttpClient = DioHttpClient(mockDioClient);
  });

  test('GET request success with Dio Adapter', () async {
    when(() => mockDioClient.get<Map<String, dynamic>>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => Response(requestOptions: RequestOptions(), data: {}, statusCode: 200));

    final response = await dioHttpClient.get('mottu.com.br');

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

    when(() => mockDioClient.get<Map<String, dynamic>>(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(mockDioError);

    expect(
      () async => await dioHttpClient.get('mottu.com.br'),
      throwsA(isA<MottuHttpException>()
          .having((e) => e.code, 'code', 404)
          .having((e) => e.httpErrorMessage, 'message', 'Not Found')
          .having((e) => e.data, 'data', {'message': 'Not Found'})),
    );
  });
}
