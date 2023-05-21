import 'package:moviedb/features/movie/presentation/states/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
class MoviesBloc extends Cubit<MovieState>{
  final GetMovies getMovies;
  MoviesBloc({
    required this.getMovies,
}): super(const MovieState());

  Future<void> getAllMovies()async{
    emit(state.copyWith(status: MovieStatus.loading));
    final response = await getMovies(NoParams());
    final newState = response.fold((left) =>  state.copyWith(status: MovieStatus.failure), (movies) {
      return state.copyWith(status: MovieStatus.success, movies: movies
      );
    });
    emit(newState);
  }


}