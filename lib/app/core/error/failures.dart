import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;
  final StackTrace? stackTrace;

  const IFailure({
    this.message = '',
    this.stackTrace,
  });

  @override
  List<Object?> get props => [
        message,
        stackTrace,
      ];
}

class Failure extends IFailure {
  const Failure({
    String message = 'Houve uma falha',
  }) : super(message: message);
}

class ServerFailure extends IFailure {
  const ServerFailure({
    String message = 'Houve um erro no servidor',
  }) : super(message: message);
}

class InternetConectionFailure extends IFailure {
  const InternetConectionFailure({
    String message = 'Sem conexão com à internet',
  }) : super(message: message);
}

class CacheFailure extends IFailure {
  const CacheFailure({
    String message = 'Houve um erro no armazenamento interno',
  }) : super(message: message);
}

class NullFailure extends IFailure {
  const NullFailure({
    String message = 'Valor Null encontrado',
  }) : super(message: message);
}

class InternalFailure extends IFailure {
  const InternalFailure({
    String message = 'Falha Interna',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmptyFailure extends IFailure {
  const EmptyFailure({
    String message = 'Não encontramos as informações',
  }) : super(message: message);
}

class UserFailure extends IFailure {
  const UserFailure({
    String message = 'Falha no Usuário',
  }) : super(message: message);
}

class SettingsFailure extends IFailure {
  final String minVersion;
  final String appVersion;

  const SettingsFailure({
    String message = 'Versão do aplicativo é inferior a versão mínima exigida',
    required this.minVersion,
    required this.appVersion,
  }) : super(message: message);

  @override
  List<Object> get props => [
        message,
        minVersion,
        appVersion,
      ];
}

class InvalidInputFailure extends IFailure {
  const InvalidInputFailure({
    String message = 'Entrada com formato inválido',
  }) : super(message: message);
}

class FirebaseFailure extends IFailure {
  const FirebaseFailure({
    String message = 'Falha no Firebase',
  }) : super(message: message);
}

class CanceledByUserFailure extends IFailure {
  const CanceledByUserFailure({
    String message = 'Ação cancelada pelo usuário',
  }) : super(message: message);
}

class PermissionFailure extends IFailure {
  const PermissionFailure({
    String message = 'Sem permissão',
  }) : super(message: message);
}
