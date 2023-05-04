import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/core/core.dart';

void main() {
  test('test ServerFailure class', () {
    expect(const ServerFailure(), const ServerFailure());
    expect(const ServerFailure(), isA<Failure>());
    expect(const ServerFailure().props.isNotEmpty, true);
  });
  test('test NetworkInfoFailure class', () {
    expect(const NetworkInfoFailure(), const NetworkInfoFailure());
    expect(const NetworkInfoFailure(), isA<Failure>());
    expect(const NetworkInfoFailure().props.isNotEmpty, true);
  });
  test('test CacheFailure class', () {
    expect(const CacheFailure(), const CacheFailure());
    expect(const CacheFailure(), isA<Failure>());
    expect(const CacheFailure().props.isNotEmpty, true);
  });
  test('test HttpFailure class', () {
    expect(const HttpFailure(), const HttpFailure());
    expect(const HttpFailure(), isA<Failure>());
    expect(const HttpFailure().props.isNotEmpty, true);
  });
}
