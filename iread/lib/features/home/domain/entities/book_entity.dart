class BookEntity {
  final String name;
  final String author;
  final String image;
  final int pagesCount;
  final String bookPath;

  BookEntity(
      {required this.bookPath,
      required this.name,
      required this.author,
      required this.image,
      required this.pagesCount});
}
