import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:iread/features/home/presentation/widgets/books_grid_view.dart';
import 'package:iread/features/home/presentation/widgets/continue_reading_books_list_view.dart';
import 'package:iread/features/home/presentation/widgets/last_opened_book_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "All Books",
                  style: Styles.textStyle24
                      .copyWith(color: kPrimaryColor, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .29,
              child: const BooksGridView(),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Lastest Open Books",
                  style: Styles.textStyle24
                      .copyWith(color: kPrimaryColor, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .29,
              child: const LastOpenedBookView(),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Continue Reading",
                  style: Styles.textStyle24
                      .copyWith(color: kPrimaryColor, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              child: const ContinueReadingBooksListView(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
