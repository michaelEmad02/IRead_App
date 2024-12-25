import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/features/home/presentation/widgets/shimmer_book_item.dart';
import 'package:iread/features/library/presentation/manager/cubit/fetch_to_read_books_cubit.dart';
import 'package:iread/features/library/presentation/widgets/library_book_item_grid_view.dart';

class ToReadBooksViewBody extends StatefulWidget {
  const ToReadBooksViewBody({super.key});

  @override
  State<ToReadBooksViewBody> createState() => _ToReadBooksViewBodyState();
}

class _ToReadBooksViewBodyState extends State<ToReadBooksViewBody> {
  @override
  void initState() {
    BlocProvider.of<FetchToReadBooksCubit>(context).fetchToReadBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<FetchToReadBooksCubit, FetchToReadBooksState>(
        builder: (context, state) {
          if (state is FetchToReadBooksILoaded) {
            return LibraryBookGridView(
              books: state.books,
            );
          } else if (state is FetchToReadBooksFailure) {
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
              return const ShimmerBookItem();
            },
          );
        },
      ),
    );
  }
}
