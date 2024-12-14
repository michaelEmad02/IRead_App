import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> execute();
}
