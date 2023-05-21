import 'package:either_dart/src/either.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/repositories/movie_repository.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';

class GetMoviesImpl extends GetMovies {
  final MovieRepository moviesRepository;

  GetMoviesImpl({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return moviesRepository.getMovies();
  }
}
