import 'package:flutter/material.dart';
import 'package:iread/features/home/presentation/widgets/last_opened_book_item.dart';

class LastOpenedBookView extends StatelessWidget {
  const LastOpenedBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3.5 / 2.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10),
      //itemExtent:MediaQuery.of(context).size.width * .8,
      //scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return LastOpenedBookItem();
      },
    );
  }
}
