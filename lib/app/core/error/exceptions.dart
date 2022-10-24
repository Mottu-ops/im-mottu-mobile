class ServerException implements Exception {
  final String message;
  int? statusCode;

  ServerException({
    this.message = 'Houve um erro no servidor',
    this.statusCode,
  });
}

class InternetException implements Exception {
  final String message;
  int? statusCode;

  InternetException({
    this.message = 'Houve um erro na conexão com a internet',
    this.statusCode,
  });
}

class CacheException implements Exception {
  final String message;

  CacheException({
    this.message = 'Houve um erro no armazenamento interno',
  });
}

class InternalException implements Exception {
  final String message;

  InternalException({
    this.message = 'Houve um erro interno',
  });
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({
    this.message = 'Não foi encontrado no armazenamento interno',
  });
}

class SessionException implements Exception {
  final String message;
  int? statusCode;

  SessionException({
    this.message = 'Houve um erro na Sessão',
    this.statusCode,
  });
}
