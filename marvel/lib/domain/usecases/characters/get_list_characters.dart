import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/core/core.dart';
import 'package:marvel/domain/domain.dart';

@lazySingleton
class GetListCharactersUsecase
    implements UseCase<List<CharactersEntity>, Params> {
  final CharactersRepositoryAbs _charactersRepositoryAbs;

  GetListCharactersUsecase({
    required CharactersRepositoryAbs charactersRepositoryAbs,
  }) : _charactersRepositoryAbs = charactersRepositoryAbs;

  @override
  Future<Either<Failure, List<CharactersEntity>>> call(params) {
    return _charactersRepositoryAbs.getList(orderBy: params.orderBy);
  }
}

class Params extends Equatable {
  const Params({this.orderBy});

  final String? orderBy;

  @override
  List<Object?> get props => [orderBy];
}
