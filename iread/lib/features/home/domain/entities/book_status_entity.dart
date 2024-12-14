class BookStatusEntity {
  final String name;
  final String image;
  final String status;
  final int pagesCount;
  final int pagesReadedCount;
  final String bookPath;

  BookStatusEntity(
      {required this.status,
      required this.pagesReadedCount,
      required this.name,
      required this.image,
      required this.pagesCount,
      required this.bookPath});
}
