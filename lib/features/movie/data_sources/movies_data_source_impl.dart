import 'package:moviedb/features/movie/api/api_client.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';
import 'package:moviedb/features/movie/api/exceptions/network_timeout_exception.dart';
import 'package:moviedb/features/movie/data_sources/movie_data_source.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

class MovieDataSourceImpl extends MovieDataSource {
  final MovieApiClient client;

  MovieDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final movies = await client.getMovies();
      return movies;
    } on NetworkTimeoutException {
      throw NetworkTimeoutException();
    } catch (error) {
      throw GenericException();
    }
  }
}
