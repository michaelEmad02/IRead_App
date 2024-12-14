import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchAllBooks();
  Future<Either<Failure, List<BookEntity>>> fetchLastOpennedBooks();
  Future<Either<Failure, List<BookStatusEntity>>> fetchContinueReadingBooks();
}