import 'package:either_dart/src/either.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';
import 'package:moviedb/features/movie/api/exceptions/network_timeout_exception.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';
import 'package:moviedb/features/movie/api/failures/generic_failure.dart';
import 'package:moviedb/features/movie/api/failures/network_timeout_failure.dart';
import 'package:moviedb/features/movie/data_sources/movie_data_source.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    try {
      final movies = await movieDataSource.getMovies();
      return Right(movies);
    } on NetworkTimeoutException {
      return const Left(NetworkTimeoutFailure());
    } on GenericException {
      return const Left(GenericFailure());
    }
  }
}
