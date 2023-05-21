import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/models/movie_model.dart';

void main() {
  group('MovieModel', () {
    const movieModel = MovieModel(
      id: 1,
      title: 'Test Movie',
      overview: 'This is a test movie.',
      posterUrl: '/poster.jpg',
      backDrop: '/backdrop.jpg',
    );

    final json = {
      'id': 1,
      'title': 'Test Movie',
      'overview': 'This is a test movie.',
      'poster_path': '/poster.jpg',
      'backdrop_path': '/backdrop.jpg',
    };

    test('fromJson returns correct MovieModel', () {
      expect(MovieModel.fromJson(json), movieModel);
    });

    test('toJson returns correct json', () {
      expect(movieModel.toJson(), json);
    });
  });
}
