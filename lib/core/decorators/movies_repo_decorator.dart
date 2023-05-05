import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/repositories/movies_repository.dart';

class MoviesRepoDecorator implements MovieRepository {
  final MovieRepository _movieRepository;

  MoviesRepoDecorator(this._movieRepository);

  @override
  Future<Marvel> getMovie() async {
    return await _movieRepository.getMovie();
  }
}
