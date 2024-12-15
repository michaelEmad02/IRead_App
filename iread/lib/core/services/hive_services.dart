import 'package:hive/hive.dart';
import 'package:iread/constants.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';

class HiveServices {
  Future<List<BookStatusEntity>> getBooksStatus(BookStatus status) async {
    var box = Hive.box<BookStatusEntity>(kBooksStatusBox);
    if (box.isEmpty) {
      return [];
    }
    return box.values.where((book) => book.status == status.name).toList();
  }

  Future<List<BookEntity>> getLastOpenedBooks() async {
    var box = Hive.box<BookEntity>(kLatestBooksBox);
    if (box.isEmpty) {
      return [];
    }
    return box.values.take(10).toList();
  }
}
