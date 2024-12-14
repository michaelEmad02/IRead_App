import 'package:hive/hive.dart';

part 'book_status_entity.g.dart';

@HiveType(typeId: 2)
class BookStatusEntity extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final int pagesCount;
  @HiveField(4)
  final int pagesReadedCount;
  @HiveField(5)
  final String bookPath;

  BookStatusEntity(
      {required this.status,
      required this.pagesReadedCount,
      required this.title,
      required this.image,
      required this.pagesCount,
      required this.bookPath});
}
