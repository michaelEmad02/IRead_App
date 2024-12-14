class BookModel {
  final String name;
  final String title;
  final String author;
  final String image;
  final int pagesCount;
  final String bookPath;
  final String size;

  BookModel(
      {required this.name,
      required this.title,
      required this.author,
      required this.image,
      required this.pagesCount,
      required this.bookPath,
      required this.size});
}
