import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;
  final int statusCode;

  const ServerException({this.message, this.statusCode = 500});

  @override
  List<Object?> get props => [message, statusCode];
}

class NetworkInfoException extends Equatable implements Exception {
  final String? message;

  const NetworkInfoException({this.message});

  @override
  List<Object?> get props => [message];
}
