import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LibraryBookGridView extends StatelessWidget {
  const LibraryBookGridView({
    super.key,
    required this.books,
  });

  final List<BookStatusEntity> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 2,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return LibraryBookItem(book: books[index]);
      },
    );
  }
}

class LibraryBookItem extends StatelessWidget {
  const LibraryBookItem({
    super.key,
    required this.book,
  });

  final BookStatusEntity book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            color: kListItemColor, borderRadius: BorderRadius.circular(15)),
       // width: MediaQuery.of(context).size.width * .76,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2.8 / 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: (book.image.isEmpty)
                          ? Image.asset(
                              AssetsPath.testBookPath,
                              fit: BoxFit.fill,
                            )
                          : Image.memory(book.image)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: Styles.textStyle18,
                          overflow: TextOverflow.ellipsis,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 13.0,
                          percent: book.pagesReadedCount /
                              book.pagesCount, // Pass progress (0.0 to 1.0)
                          center: Text(
                            "${(book.pagesReadedCount / book.pagesCount * 100).toStringAsFixed(0)}%",
                            style: const TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.grey[300]!,
                          progressColor: kSecondColor,
                          padding: EdgeInsets.zero,
                          animation: true,
                          animationDuration: 1000,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
