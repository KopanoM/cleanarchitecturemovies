// ... (imports)

import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:moviedb/features/movie/api/api_client_impl.dart';
import 'package:moviedb/features/movie/data_sources/movie_data_source.dart';
import 'package:moviedb/features/movie/data_sources/movies_data_source_impl.dart';
import 'package:http/http.dart' as http;
import 'package:moviedb/features/movie/repositories/movie_repository.dart';
import 'package:moviedb/features/movie/repositories/movie_respository_impl.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
import 'package:moviedb/features/movie/use_cases/get_movies_impl.dart';

final serviceLocator = GetIt.instance;
final http.Client httpClient = Client();
final client = MovieApiClientImpl(
    httpClient: httpClient, apiKey: 'afe12e978611e6783529045cfc80ab53');

Future<void> registerServices() async {
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}


void _registerDataSources() {
  serviceLocator.registerLazySingleton<MovieDataSource>(() {
    return MovieDataSourceImpl(client: client);
  });
  // ...
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<MovieRepository>(() {
    return MovieRepositoryImpl(
        movieDataSource: serviceLocator<MovieDataSource>());
  });
}

void _registerUseCases() {
  serviceLocator.registerLazySingleton<GetMovies>(() {
    return GetMoviesImpl(moviesRepository: serviceLocator<MovieRepository>());
  });
}

