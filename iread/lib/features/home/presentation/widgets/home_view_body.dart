import 'package:flutter/material.dart';
import 'package:iread/features/home/presentation/widgets/books_grid_view.dart';
import 'package:iread/features/home/presentation/widgets/last_opened_book_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .29,
            child: const BooksGridView(),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .29,
            child: const LastOpenedBookView(),
          ),
        ],
      ),
    );
  }
}
