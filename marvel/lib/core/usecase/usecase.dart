import 'package:dartz/dartz.dart';
import 'package:marvel/core/erros/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
