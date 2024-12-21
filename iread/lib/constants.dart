import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.pink.shade500;
const kSecondColor = Color.fromARGB(255, 123, 107, 241);
Color kPrimaryTextColor = const Color(0xffFFFFFF);
Color kThirdColor = Colors.cyan.shade700;

Color kListItemColor = Colors.grey.withOpacity(0.15);
Duration kTransitionDuration = const Duration(milliseconds: 250);

const kMainfontFamily = "Item";

const kLatestBooksBox = "LatestBooksBox";

const kBooksStatusBox = "BooksStatusBox";

const kFavoriteBooksBox = "FavoriteBooksBox";
const kBookImageBox = "BookImageBox";

enum BookStatus {
  //normal,
  toRead,
  reading,
  completed,
}
