import 'dart:io';

import 'package:iread/constants.dart';
import 'package:iread/core/services/hive_services.dart';
import 'package:iread/core/services/local_storage_services.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<File>> fetchAllBooksPaths();
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
    /*var books = await hiveServices.getAllBooks();
    if (books.isNotEmpty) {
      return books;
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
}
