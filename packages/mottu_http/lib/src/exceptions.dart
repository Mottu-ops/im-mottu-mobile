class MottuHttpException implements Exception {
  final String httpErrorMessage;
  Map<String, dynamic>? data = {'message': unexpectedErrorMessage};
  final int code;

  MottuHttpException({this.data, required this.httpErrorMessage, required this.code});

  @override
  String toString() {
    return 'HttpException: $httpErrorMessage (body: ${data?['message']}, code: $code)';
  }
}

const unexpectedErrorMessage = 'Mottu network unexpected error';
const unexpectedErrorCode = 0;
