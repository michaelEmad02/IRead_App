import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/features/library/domain/entities/book_status_entity.dart';

abstract class LibraryRepo {
  Future<Either<Failure, List<BookStatusEntity>>> fetchToReadBooks();
  Future<Either<Failure, List<BookStatusEntity>>> fetchReadingBooks();
  Future<Either<Failure, List<BookStatusEntity>>> fetchCompletedBooks();

  Future<Either<Failure, void>> addBook({required BookStatusEntity book});

  Future<Either<Failure, void>> updateBook(
      {required BookStatusEntity book});

  Future<Either<Failure, void>> removeBook(
      {required BookStatusEntity book});
}
