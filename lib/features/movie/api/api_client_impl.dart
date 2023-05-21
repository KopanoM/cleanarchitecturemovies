import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviedb/features/movie/api/api_client.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/models/movie_model.dart';

const movieImageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
const url = 'api.themoviedb.org';
const baseUrl = '/3/discover/movie';

class MovieApiClientImpl extends MovieApiClient {
  final http.Client httpClient;
  final String apiKey;

  MovieApiClientImpl({required this.httpClient, required this.apiKey});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await httpClient.get(
          Uri.https(
            url,
            baseUrl,
            {
              'include_adult': 'false',
              'include_video': 'false',
              'language': 'en-US',
              'page': '1',
              'sort_by': 'popularity.desc',
              'api_key': apiKey,
            },
          ),
          headers: {
            'accept': 'application/json',
          });

      if (response.statusCode != 200) {
        throw GenericException('Failed to load movies: ${response.statusCode}');
      }
      final json = jsonDecode(response.body);
      final movies = (json['results'] as Iterable)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } catch (error) {
      throw GenericException();
    }
  }
}
