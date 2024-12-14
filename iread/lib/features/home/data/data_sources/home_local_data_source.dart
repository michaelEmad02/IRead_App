import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<BookEntity>> fetchAllBooks();
  Future<List<BookEntity>> fetchLastOpennedBooks();
  Future<List<BookStatusEntity>> fetchContinueReadingBooks();
}
