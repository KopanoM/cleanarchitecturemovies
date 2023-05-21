import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb/features/movie/api/api_client_impl.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

import 'api_client_impl_test.mocks.dart'as api;

@GenerateMocks([http.Client])
void main() {
  group('MovieApiClientImpl', () {
    final mockClient = api.MockClient();
    const apiKey = 'test_api_key';
    final apiClient = MovieApiClientImpl(httpClient: mockClient, apiKey: apiKey);

    test('returns a list of movies if the http call completes successfully', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('{"results": [{"id": 1, "title": "Test Movie", "poster_path": "/test.jpg","backdrop_path": "/test.jpg", "overview": "overview"}]}', 200));

      expect(await apiClient.getMovies(), isA<List<Movie>>());
    });

    test('throws an exception if the http call completes with an error', () {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiClient.getMovies(), throwsA(isA<GenericException>()));
    });
  });
}
