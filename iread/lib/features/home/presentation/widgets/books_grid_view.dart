import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/features/home/presentation/manager/cubit/fetch_all_books_cubit.dart';
import 'package:iread/features/home/presentation/widgets/book_item.dart';
import 'package:iread/features/home/presentation/widgets/shimmer_book_item.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllBooksCubit, FetchAllBooksState>(
      builder: (context, state) {
        if (state is FetchAllBooksLoaded) {
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
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookItem(
                selectedBook: state.books[index],
              );
            },
          );
        } else if (state is FetchAllBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return GridView.builder(
          scrollDirection: Axis.horizontal,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10),
          //itemExtent:MediaQuery.of(context).size.width * .8,
          //scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: ShimmerBookItem(),
            );
          },
        );
      },
    );
  }
}
