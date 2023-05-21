import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/api/api_client.dart';
import 'package:moviedb/features/movie/data_sources/movie_data_source.dart';
import 'package:moviedb/features/movie/repositories/movie_repository.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
import 'package:moviedb/locator.dart';
import 'package:mockito/annotations.dart';
import 'locator_test.mocks.dart';
// Generate mocks for your classes

@GenerateMocks([MovieDataSource, MovieRepository, GetMovies, MovieApiClient])
void main() {
  setUp(() async {
    serviceLocator.reset();
    // Register the mocks in the service locator
    serviceLocator
        .registerLazySingleton<MovieDataSource>(() => MockMovieDataSource());
    serviceLocator
        .registerLazySingleton<MovieRepository>(() => MockMovieRepository());
    serviceLocator.registerLazySingleton<GetMovies>(() => MockGetMovies());
  });

  test('should register MovieDataSource', () {
    expect(serviceLocator<MovieDataSource>(), isA<MockMovieDataSource>());
  });

  test('should register MovieRepository', () {
    expect(serviceLocator<MovieRepository>(), isA<MockMovieRepository>());
  });

  test('should register GetMovies', () {
    expect(serviceLocator<GetMovies>(), isA<MockGetMovies>());
  });
}
