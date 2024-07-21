
import 'i_failure.dart';

class DatasourceError extends IFailure {
  const DatasourceError({
    required super.message,
    required super.stackTrace,
  });
}
