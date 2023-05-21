import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/api/failures/network_timeout_failure.dart';

void main() {
  group('NetworkTimeoutFailure', () {
    test('should return correct message when a message is provided', () {
      const message = 'test network timeout';
      const failure = NetworkTimeoutFailure(message);

      expect(failure.message, message);
    });

    test('should return default message when no message is provided', () {
      const failure =  NetworkTimeoutFailure();

      expect(failure.message, 'network timeout');
    });
  });
}
