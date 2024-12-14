import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final int pagesCount;
  @HiveField(4)
  final String bookPath;

  BookEntity(
      {required this.bookPath,
      required this.title,
      required this.author,
      required this.image,
      required this.pagesCount});
}
