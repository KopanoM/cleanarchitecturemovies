import 'package:moviedb/features/movie/api/failures/failures.dart';

class GenericFailure extends Failure {
  final String message;

  const GenericFailure([this.message = 'generic failure']);

  @override
  List<Object?> get props => [
    message,
  ];
}
