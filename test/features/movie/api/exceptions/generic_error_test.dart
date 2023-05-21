import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/api/exceptions/generic_error.dart';


void main() {
  group('GenericException', () {
    test('should return correct message when a message is provided', () {
      const message = 'test exception';
      final exception = GenericException(message);

      expect(exception.message, message);
    });

    test('should return default message when no message is provided', () {
      final exception = GenericException();

      expect(exception.message, 'something went wrong');
    });
  });
}
