import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mottu_http/src/dio_cache_interceptor.dart';
import 'package:persistence/persistence.dart';

class MockKeyValuePersistence extends Mock implements KeyValuePersistence {}

class MockRequestInterceptorHandler extends Mock implements RequestInterceptorHandler {}

class MockResponseInterceptorHandler extends Mock implements ResponseInterceptorHandler {}

class FakeResponse extends Fake implements Response<dynamic> {}

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  late DioCacheInterceptor interceptor;
  late MockKeyValuePersistence mockPersistence;
  late MockRequestInterceptorHandler mockRequestHandler;
  late MockResponseInterceptorHandler mockResponseHandler;
  late RequestOptions options;

  setUpAll(() {
    registerFallbackValue(FakeResponse());
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockPersistence = MockKeyValuePersistence();
    mockRequestHandler = MockRequestInterceptorHandler();
    mockResponseHandler = MockResponseInterceptorHandler();
    interceptor = DioCacheInterceptor(persistence: mockPersistence);

    options = RequestOptions(path: '/characters', method: 'GET', baseUrl: 'https://api.mottu.com.br/marvel');
  });

  group('DioCacheInterceptor onRequest', () {
    test('Given a valid TTL, when a GET request is fired, then returns a cached data', () async {
      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'etag': '123456',
        'data': {'key': 'value'}
      };

      when(() => mockPersistence.read<Map<String, dynamic>>(any())).thenAnswer((_) async => cacheData);

      await interceptor.onRequest(options, mockRequestHandler);

      verify(() => mockRequestHandler.resolve(any(that: isA<Response>()))).called(1);
      verifyNever(() => mockRequestHandler.next(any()));
    });

    test('Given a valid GET request, when there\'s no data in cache, then forwards the request', () async {
      when(() => mockPersistence.read<Map<String, dynamic>>(any())).thenAnswer((_) async => null);

      await interceptor.onRequest(options, mockRequestHandler);

      verify(() => mockRequestHandler.next(any())).called(1);
    });
  });

  group('DioCacheInterceptor onResponse', () {
    test(
        'Given a HTTP 304 response, when the response arrives, then return a cached data, because etag has been previously sent',
        () async {
      final response = Response(
        requestOptions: options,
        statusCode: 304,
      );

      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'etag': '123456',
        'data': {'key': 'value'}
      };

      when(() => mockPersistence.read<Map<String, dynamic>>(any())).thenAnswer((_) async => cacheData);

      await interceptor.onResponse(response, mockResponseHandler);

      verify(() => mockResponseHandler.resolve(any(that: isA<Response>()))).called(1);
    });

    test('Given a GET request, when a new path is requested, saves new data to cache on 200 response', () async {
      when(() => mockPersistence.save<Map<String, dynamic>>(any(), any())).thenAnswer((_) async => true);
      final response = Response(
        requestOptions: options,
        statusCode: 200,
        data: {
          'etag': '123456',
          'data': {'key': 'new value'}
        },
      );

      await interceptor.onResponse(response, mockResponseHandler);

      verify(() => mockPersistence.save<Map<String, dynamic>>(any(), any())).called(1);
      verify(() => mockResponseHandler.next(response)).called(1);
    });
  });
}
