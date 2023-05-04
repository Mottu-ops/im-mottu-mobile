import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  final int? statusCode;
  final String? type;
  final String? message;
  final Exception? exception;

  const ServerFailure({
    this.statusCode,
    this.type,
    this.message,
    this.exception,
  });

  @override
  List<Object?> get props => [statusCode, type, message, exception];
}

class NetworkInfoFailure extends Failure {
  final String? message;
  final Exception? exception;

  const NetworkInfoFailure({this.message, this.exception});

  @override
  List<Object?> get props => [message, exception];
}

class CacheFailure extends Failure {
  final String? message;
  final Exception? exception;

  const CacheFailure({this.message, this.exception});

  @override
  List<Object?> get props => [message, exception];
}

class HttpFailure extends Failure {
  final String? message;
  final Exception? exception;

  const HttpFailure({this.message, this.exception});

  @override
  List<Object?> get props => [message, exception];
}
