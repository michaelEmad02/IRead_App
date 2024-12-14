import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> getAllBooks();
  Future<Either<Failure, List<BookEntity>>> getLastOpennedBooks();
  Future<Either<Failure, List<BookEntity>>> getContinueReadingBooks();
}
