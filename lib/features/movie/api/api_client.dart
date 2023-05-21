import 'package:moviedb/features/movie/entities/movie.dart';

const movieBaseUrl = 'https://image.tmdb.org/t/p/w500/';

abstract class MovieApiClient {
  Future<List<Movie>> getMovies();
}
