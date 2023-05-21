import 'package:equatable/equatable.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/use_cases/use_case.dart';


abstract class GetMovies
    implements UseCase<List<Movie>, NoParams>{}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

