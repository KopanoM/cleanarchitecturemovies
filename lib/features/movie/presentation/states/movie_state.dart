import 'package:equatable/equatable.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

enum MovieStatus { loading, failure, success, initial }

class MovieState extends Equatable {
  final List<Movie> movies;
  final MovieStatus status;
  final String? errorMessage;

  const MovieState({this.movies = const [], this.errorMessage, this.status = MovieStatus.initial});

  MovieState copyWith({List<Movie>? movies,MovieStatus? status, String? errorMessage}) {
    return MovieState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [movies,errorMessage,status];
}
