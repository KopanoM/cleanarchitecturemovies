import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/presentation/states/movie_state.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
import 'package:moviedb/features/movie/presentation/bloc/movies_bloc.dart';
import 'package:either_dart/either.dart';

class MockGetMovies extends Mock implements GetMovies {}

void main() {
  late MockGetMovies mockGetMovies;

  setUp(() {
    mockGetMovies = MockGetMovies();
  });

  blocTest<MoviesBloc, MovieState>(
    'should emit [loading, success] when movies are fetched successfully',
    build: () {
      when(() => mockGetMovies(NoParams())).thenAnswer((_) async =>const Right([
        Movie(
            id: 1,
            title: 'Test Movie',
            overview: 'Test Overview',
            posterUrl: 'test.com',
            backDrop: 'test.com')
      ]));
      return MoviesBloc(getMovies: mockGetMovies);
    },
    act: (bloc) => bloc.getAllMovies(),
    expect: () =>const [
      MovieState(status: MovieStatus.loading),
      MovieState(
          status: MovieStatus.success,
          movies: [
            Movie(
                id: 1,
                title: 'Test Movie',
                overview: 'Test Overview',
                posterUrl: 'test.com',
                backDrop: 'test.com')
          ]),
    ],
  );

  blocTest<MoviesBloc, MovieState>(
    'should emit [loading, failure] when fetching of movies fails',
    build: () {
      when(() => mockGetMovies(NoParams())).thenAnswer((_) async => Left(Failure()));
      return MoviesBloc(getMovies: mockGetMovies);
    },
    act: (bloc) => bloc.getAllMovies(),
    expect: () => const[
      MovieState(status: MovieStatus.loading),
      MovieState(status: MovieStatus.failure),
    ],
  );
}
