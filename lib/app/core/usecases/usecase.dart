import 'package:dartz/dartz.dart';
import 'package:mottu_marvel/app/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}
