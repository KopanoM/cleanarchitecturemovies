import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb/features/movie/api/api_client.dart';
import 'package:moviedb/features/movie/api/exceptions/network_timeout_exception.dart';
import 'package:moviedb/features/movie/data_sources/movies_data_source_impl.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

import 'movie_data_source_test.mocks.dart';

@GenerateMocks([MovieApiClient])
void main() {
  late MovieDataSourceImpl dataSource;
  late MockMovieApiClient mockClient;

  setUp(() {
    mockClient = MockMovieApiClient();
    dataSource = MovieDataSourceImpl(client: mockClient);
  });

  group('getMovies', () {
    test('returns a list of movies when the call is successful', () async {
      const movies = [
        Movie(
            id: 1,
            title: 'Test',
            overview: 'Test',
            posterUrl: 'Test',
            backDrop: 'Test')
      ];
      when(mockClient.getMovies())
          .thenAnswer((_) async => Future.value(movies));

      expect(await dataSource.getMovies(), equals(movies));
    });

    test('throws a GenericException when a NetworkTimeoutException is thrown',
        () async {
      when(mockClient.getMovies()).thenThrow(NetworkTimeoutException());

      expect(() async => await dataSource.getMovies(),
          throwsA(isA<NetworkTimeoutException>()));
    });
  });
}
