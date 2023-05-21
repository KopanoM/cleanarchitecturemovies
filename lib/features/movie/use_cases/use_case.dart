import 'package:either_dart/either.dart';
import 'package:moviedb/features/movie/api/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}