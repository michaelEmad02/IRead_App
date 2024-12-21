import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> execute(Param param);
}
