import 'package:moviedb/features/movie/api/failures/failures.dart';

class NetworkTimeoutFailure extends Failure {
  final String message;

  const NetworkTimeoutFailure([this.message = 'network timeout']);

  @override
  List<Object?> get props => [
        message,
      ];
}
