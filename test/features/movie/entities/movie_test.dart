import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/entities/movie.dart';

void main() {
  group('Movie', () {
    const movie = Movie(
      id: 1,
      title: 'Test Movie',
      overview: 'This is a test movie.',
      posterUrl: 'https://example.com/poster.jpg',
      backDrop: 'https://example.com/backdrop.jpg',
    );

    test('props returns correct list', () {
      expect(
        movie.props,
        [
          1,
          'Test Movie',
          'This is a test movie.',
          'https://example.com/poster.jpg',
          'https://example.com/backdrop.jpg',
        ],
      );
    });
  });
}
