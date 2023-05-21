import 'package:either_dart/either.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure,List<Movie>>> getMovies();
}