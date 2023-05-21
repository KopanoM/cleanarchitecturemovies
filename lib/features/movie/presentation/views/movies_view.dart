import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/features/movie/api/api_client.dart';
import 'package:moviedb/features/movie/presentation/bloc/movies_bloc.dart';
import 'package:moviedb/features/movie/presentation/states/movie_state.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
import 'package:moviedb/locator.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc(getMovies: serviceLocator<GetMovies>())..getAllMovies(),
      child: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          if (state.status == MovieStatus.loading ||
              state.status == MovieStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == MovieStatus.failure) {
            return const Center(child: Text('Failed to load movies'));
          }

          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network('$movieBaseUrl${state.movies[index].posterUrl}'),
                title: Text(state.movies[index].title),
                subtitle: Text(state.movies[index].overview),
              );
            },
          );
        },
      ),
    );
  }
}
