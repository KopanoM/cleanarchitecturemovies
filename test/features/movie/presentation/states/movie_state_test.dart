import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/entities/movie.dart';
import 'package:moviedb/features/movie/presentation/states/movie_state.dart';

void main() {
  group('MovieState', () {
    test('supports value comparisons', () {
      expect(
        const MovieState(),
        const MovieState(),
      );
    });

    test('returns same object when no parameters are passed', () {
      expect(
        const MovieState().copyWith(),
        const MovieState(),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const MovieState().copyWith(status: MovieStatus.loading),
        const MovieState(status: MovieStatus.loading),
      );
    });

    test('returns object with updated movies when movies are passed', () {
      expect(
        const MovieState().copyWith(movies: const [
          Movie(
            id: 1,
            title: 'Test Movie',
            overview: 'Test Overview',
            posterUrl: 'test.com',
            backDrop: 'test.com',
          )
        ]),
        const MovieState(
          movies: [
            Movie(
              id: 1,
              title: 'Test Movie',
              overview: 'Test Overview',
              posterUrl: 'test.com',
              backDrop: 'test.com',
            )
          ],
        ),
      );
    });

    test('returns object with updated errorMessage when errorMessage is passed',
        () {
      expect(
        const MovieState().copyWith(errorMessage: 'Error'),
        const MovieState(errorMessage: 'Error'),
      );
    });
  });
}
