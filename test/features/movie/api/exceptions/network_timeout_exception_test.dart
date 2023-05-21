import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/api/exceptions/network_timeout_exception.dart';


void main() {
  group('NetworkTimeoutException', () {
    test('should return correct message when calling toString', () {
      final exception = NetworkTimeoutException();

      expect(
        exception.toString(),
        'This request is taking too long. Please ensure you have a stable internet connection.',
      );
    });
  });
}
