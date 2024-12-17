import 'dart:typed_data';

import 'package:iread/features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final String name;
  final String bookTitle;
  //final String bookAuthor;
  final Uint8List? bookImage;
  final int bookPagesCount;
  final String bookLoaclPath;
  //final String size;

  BookModel({
    required this.name,
    required this.bookTitle,
    // required this.bookAuthor,
    required this.bookImage,
    required this.bookPagesCount,
    required this.bookLoaclPath,
    //  required this.size
  }) : super(
            bookPath: bookLoaclPath,
            title: bookTitle,
            //author: bookAuthor,
            image: bookImage,
            pagesCount: bookPagesCount);
}
