import 'package:flutter/material.dart';
import 'package:iread/constants.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';
import 'package:iread/features/home/presentation/widgets/continue_reading_book_item.dart';
import 'package:iread/features/home/presentation/widgets/continue_reading_item_shimmer.dart';

class ContinueReadingBooksListView extends StatelessWidget {
  const ContinueReadingBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, mainAxisSpacing: 8, childAspectRatio: 1 / 2),
      //itemExtent:MediaQuery.of(context).size.width * .8,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ContinueReadingBookItem();
      },
    );
  }
}
