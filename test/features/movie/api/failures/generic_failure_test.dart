
import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/features/movie/api/failures/generic_failure.dart';

void main() {
  group('GenericFailure', () {
    // Test the default message value
    test('default value is correct', () {
      const failure = GenericFailure();
      expect(failure.message, 'generic failure');
    });

    // Test the provided message value
    test('provided value is correct', () {
      const failure =  GenericFailure('Test message');
      expect(failure.message, 'Test message');
    });

    // Test that the props list is correct
    test('props value is correct', () {
      const failure =  GenericFailure( 'Test message');
      expect(failure.props, ['Test message']);
    });

    // Test the equality comparison
    test('supports value comparisons', () {
      expect(const GenericFailure( 'Error 1'), equals(const GenericFailure('Error 1')));
      expect(const GenericFailure('Error 1'), isNot(equals(const GenericFailure('Error 2'))));
    });
  });
}
