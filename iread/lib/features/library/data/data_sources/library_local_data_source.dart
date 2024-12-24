import 'package:iread/constants.dart';
import 'package:iread/core/services/hive_services.dart';
import 'package:iread/core/entities/book_status_entity.dart';

abstract class LibraryLocalDataSource {
  Future<List<BookStatusEntity>> fetchToReadBooks();
  Future<List<BookStatusEntity>> fetchReadingBooks();
  Future<List<BookStatusEntity>> fetchCompletedBooks();
  Future<void> addBook({required BookStatusEntity book});
  Future<void> updateBook({required BookStatusEntity book});
  Future<void> removeBook({required BookStatusEntity book});
}

class LibraryLocalDataSourceImplementation extends LibraryLocalDataSource {
  final HiveServices hiveServices;

  LibraryLocalDataSourceImplementation({required this.hiveServices});
  @override
  Future<void> addBook({required BookStatusEntity book}) {
    return hiveServices.addBookStatus(book);
  }

  @override
  Future<List<BookStatusEntity>> fetchCompletedBooks() {
    return hiveServices.getBooksStatus(BookStatus.completed);
  }

  @override
  Future<List<BookStatusEntity>> fetchReadingBooks() {
    return hiveServices.getBooksStatus(BookStatus.reading);
  }

  @override
  Future<List<BookStatusEntity>> fetchToReadBooks() {
    return hiveServices.getBooksStatus(BookStatus.toRead);
  }

  @override
  Future<void> removeBook({required BookStatusEntity book}) {
    return hiveServices.removeBookStatus(book);
  }

  @override
  Future<void> updateBook({required BookStatusEntity book}) {
    return hiveServices.updateBookStatus(book);
  }
}
