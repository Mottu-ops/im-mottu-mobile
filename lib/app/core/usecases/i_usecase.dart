import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Either<IFailure, Type> call(Params params);
}

abstract class IParams {
  const IParams();
}

class NoParams extends IParams {
  const NoParams();
}

void voidRight;

Future<T> handleUseCase<T>(
  UseCase usecase, [
  IParams params = const NoParams(),
]) async {
  final failureOrSuccess = await usecase(params);

  return failureOrSuccess.fold(
    (failure) => throw failure,
    (success) => success as T,
  );
}

T handleUseCaseSync<T>(
  UseCaseSync usecase, [
  IParams params = const NoParams(),
]) {
  final failureOrSuccess = usecase(params);

  return failureOrSuccess.fold(
    (failure) => throw failure,
    (success) => success as T,
  );
}
