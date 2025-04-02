class HttpResponse {
  final dynamic data;
  final StatusCodeEnum statusCode;

  HttpResponse({
    this.data,
    required this.statusCode,
  });
}

enum StatusCodeEnum {
  ok(200, 'Ok', isSuccess: true),
  created(201, 'Created', isSuccess: true),
  accepted(202, 'Accepted', isSuccess: true),
  noContent(204, 'No Content', isSuccess: true),
  badRequest(400, 'Bad Request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not Found'),
  requestTimeout(408, 'Request Timeout'),
  internalServerError(500, 'Internal Server Error');

  final int statusCode;
  final String message;
  final bool isSuccess;

  bool get isError => !isSuccess;

  const StatusCodeEnum(
    this.statusCode,
    this.message, {
    this.isSuccess = false,
  });

  static StatusCodeEnum fromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 200:
        return StatusCodeEnum.ok;
      case 201:
        return StatusCodeEnum.created;
      case 202:
        return StatusCodeEnum.accepted;
      case 204:
        return StatusCodeEnum.noContent;
      case 400:
        return StatusCodeEnum.badRequest;
      case 401:
        return StatusCodeEnum.unauthorized;
      case 403:
        return StatusCodeEnum.forbidden;
      case 404:
        return StatusCodeEnum.notFound;
      case 408:
        return StatusCodeEnum.requestTimeout;
      case 500:
        return StatusCodeEnum.internalServerError;
      default:
        return StatusCodeEnum.internalServerError;
    }
  }
}
