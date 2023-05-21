import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';
import 'package:moviedb/features/movie/api/exceptions/network_timeout_exception.dart';
import 'package:moviedb/features/movie/api/failures/generic_failure.dart';
import 'package:moviedb/features/movie/api/failures/network_timeout_failure.dart';
import 'package:moviedb/features/movie/data_sources/movie_data_source.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/repositories/movie_respository_impl.dart';
import 'movie_repository_test.mocks.dart';

@GenerateMocks([MovieDataSource])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMovieDataSource();
    repository = MovieRepositoryImpl(movieDataSource: mockDataSource);
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
      when(mockDataSource.getMovies()).thenAnswer((_) async => movies);

      final result = await repository.getMovies();

      expect(result, const Right(movies));
      result.fold((l) => null, (r) => expect(r, equals(movies)));
    });

    test(
        'returns a NetworkTimeoutFailure when a NetworkTimeoutException is thrown',
        () async {
      when(mockDataSource.getMovies()).thenThrow(NetworkTimeoutException());

      final result = await repository.getMovies();

      expect(result, const Left(NetworkTimeoutFailure()));
      result.fold((l) => expect(l, isA<NetworkTimeoutFailure>()), (r) => null);
    });

    test('returns a GenericFailure when a GenericException is thrown',
        () async {
      when(mockDataSource.getMovies()).thenThrow(GenericException());

      final result = await repository.getMovies();

      expect(result, const Left(GenericFailure()));
      result.fold((l) => expect(l, isA<GenericFailure>()), (r) => null);
    });
  });
}
