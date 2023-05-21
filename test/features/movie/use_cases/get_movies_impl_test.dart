import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';
import 'package:moviedb/features/movie/api/failures/generic_failure.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/repositories/movie_repository.dart';
import 'package:moviedb/features/movie/use_cases/get_movies.dart';
import 'package:moviedb/features/movie/use_cases/get_movies_impl.dart';
import 'get_movies_impl_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late GetMoviesImpl useCase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = GetMoviesImpl(moviesRepository: mockRepository);
  });

  group('call', () {
    test('returns a list of movies when the call is successful', () async {
      const movies =  [Movie(id: 1, title: 'Test', overview: 'Test', posterUrl: 'Test', backDrop: 'Test')];
      when(mockRepository.getMovies()).thenAnswer((_) async => const Right(movies));

      final result = await useCase(NoParams());

      expect(result, const Right(movies));
      result.fold((l) => null, (r) => expect(r, equals(movies)));
    });

    test('returns a Failure when the call is unsuccessful', () async {
      when(mockRepository.getMovies()).thenAnswer((_) async =>const Left(GenericFailure()));

      final result = await useCase(NoParams());

      expect(result, const Left(GenericFailure()));
      result.fold((l) => expect(l, isA<Failure>()), (r) => null);
    });
  });
}
