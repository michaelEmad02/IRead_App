import 'dart:io';
import 'dart:typed_data';
import 'package:iread/constants.dart';
import 'package:iread/core/services/hive_services.dart';
import 'package:iread/core/services/local_storage_services.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<File>> fetchAllBooksPaths();
  Future<Uint8List> fetchBookImage(String filePath);
  Future<List<BookEntity>> fetchLastOpennedBooks();
  Future<List<BookStatusEntity>> fetchContinueReadingBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  final LocalStorageServices localStorageServices;
  final HiveServices hiveServices;

  HomeLocalDataSourceImplementation(
      {required this.localStorageServices, required this.hiveServices});
  @override
  Future<List<File>> fetchAllBooksPaths() async {
    /* var books = await hiveServices.getAllBooks();
    var booksFiles = await localStorageServices.getBooksFiles();
    if (books.isNotEmpty) {
      for (var book in booksFiles) {
        if (books.where((b) => b.bookPath == book.path).isEmpty) {
          final box = Hive.box<BookEntity>('BooksBox');
          var image = await localStorageServices.fetchBookImage(book.path);
          box.add(BookEntity(
              bookPath: book.path,
              title: book.uri.pathSegments.last,
              image: image));
        }
      }
    }*/
    return localStorageServices.getBooksFiles();
  }

  @override
  Future<List<BookStatusEntity>> fetchContinueReadingBooks() {
    return hiveServices.getBooksStatus(BookStatus.reading);
  }

  @override
  Future<List<BookEntity>> fetchLastOpennedBooks() {
    return hiveServices.getLastOpenedBooks();
  }

  @override
  Future<Uint8List> fetchBookImage(String filePath) {
    return localStorageServices.fetchBookImage(filePath);
  }
}
