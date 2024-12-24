import 'package:hive/hive.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';

class HiveServices {
  Future<List<BookStatusEntity>> getBooksStatus(BookStatus status) async {
    var box = Hive.box<BookStatusEntity>(kBooksStatusBox);
    if (box.isEmpty) {
      return [];
    }
    return box.values.where((book) => book.status == status.name).toList();
  }

  Future<List<BookEntity>> getAllBooks() async {
    var box = Hive.box<BookEntity>("BooksBox");
    if (box.isEmpty) {
      return [];
    }
    return box.values.toList();
  }

  Future<List<BookEntity>> getLastOpenedBooks() async {
    var box = Hive.box<BookEntity>(kLatestBooksBox);
    if (box.isEmpty) {
      return [];
    }
    return box.values.take(10).toList();
  }

  Future<void> addBookStatus(BookStatusEntity book) async {
    var box = Hive.box<BookStatusEntity>(kBooksStatusBox);
    var books =
        box.values.where((book) => book.bookPath == book.bookPath).toList();
    if (books.isEmpty) {
      box.add(book);
    }
  }

  Future<void> updateBookStatus(BookStatusEntity book) async {
    var box = Hive.box<BookStatusEntity>(kBooksStatusBox);
    var books =
        box.values.where((book) => book.bookPath == book.bookPath).toList();
    if (books.isNotEmpty) {
      books.first.delete();
    }
    books.add(book);
  }

  Future<void> removeBookStatus(BookStatusEntity book) async {
    var box = Hive.box<BookStatusEntity>(kBooksStatusBox);
    var books =
        box.values.where((book) => book.bookPath == book.bookPath).toList();
    if (books.isNotEmpty) {
      books.first.delete();
    }
  }
}
