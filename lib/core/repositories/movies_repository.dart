import 'package:mottu_test/core/models/marvel_model.dart';

abstract class MovieRepository {
  Future<Marvel> getMovie();
}
