import 'package:moviedb/features/movie/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getMovies();
}