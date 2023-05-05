import 'dart:convert';
import 'package:mottu_test/core/decorators/movies_repo_decorator.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepoDecorator extends MoviesRepoDecorator {
  MoviesCacheRepoDecorator(MovieRepository moviesRepo) : super(moviesRepo);

  @override
  Future<Marvel> getMovie() async {
    try {
      Marvel movies = await super.getMovie();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Marvel movie) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movie.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<Marvel> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJson = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJson);
    var movies = Marvel.fromJson(json);
    return movies;
  }
}
