abstract class HttpException {
  final String? message;
  final StackTrace? stackTrace;

  const HttpException(this.message, this.stackTrace);
}

class HttpConnectionException extends HttpException {
  const HttpConnectionException({String? message, StackTrace? stackTrace})
    : super(message, stackTrace);
}

class HttpNotFoundException extends HttpException {
  const HttpNotFoundException({String? message, StackTrace? stackTrace})
    : super(message, stackTrace);
}

class HttpUnexpectedException extends HttpException {
  final int? statusCode;
  const HttpUnexpectedException({
    String? message,
    StackTrace? stackTrace,
    this.statusCode,
  }) : super(message, stackTrace);
}
