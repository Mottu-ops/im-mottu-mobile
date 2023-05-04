import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/core/core.dart';

void main() {
  const String tMessage = 'erro message';
  test('test ServerException class', () {
    ServerException instance = const ServerException(
      message: tMessage,
    );
    expect([tMessage, 500], instance.props);
  });

  test('test NetworkInfoException class', () {
    NetworkInfoException instance =
        const NetworkInfoException(message: tMessage);
    expect([tMessage], instance.props);
  });

  test('test HttpException class', () {
    HttpException instance = const HttpException(message: tMessage);
    expect([tMessage], instance.props);
  });
}
