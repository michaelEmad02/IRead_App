import 'package:dartz/dartz.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/features/library/data/data_sources/library_local_data_source.dart';
import 'package:iread/features/library/domain/repositories/library_repo.dart';

class LibraryRepoImplementation extends LibraryRepo {
  final LibraryLocalDataSource libraryLocalDataSource;

  LibraryRepoImplementation({required this.libraryLocalDataSource});
  @override
  Future<Either<Failure, void>> addBook(
      {required BookStatusEntity book}) async {
    try {
      var result = await libraryLocalDataSource.addBook(book: book);
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookStatusEntity>>> fetchCompletedBooks() async {
    try {
      var result = await libraryLocalDataSource.fetchCompletedBooks();
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookStatusEntity>>> fetchReadingBooks() async {
    try {
      var result = await libraryLocalDataSource.fetchReadingBooks();
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookStatusEntity>>> fetchToReadBooks() async {
    try {
      var result = await libraryLocalDataSource.fetchToReadBooks();
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeBook(
      {required BookStatusEntity book}) async {
    try {
      var result = await libraryLocalDataSource.removeBook(book: book);
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateBook(
      {required BookStatusEntity book}) async {
    try {
      var result = await libraryLocalDataSource.updateBook(book: book);
      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
