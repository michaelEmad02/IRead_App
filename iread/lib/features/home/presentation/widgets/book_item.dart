import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/utils/assets_path.dart';
import 'package:iread/core/utils/styles.dart';
import 'package:iread/features/home/data/repositories/home_repo_implementation.dart';
import 'package:iread/features/home/domain/use_cases/fetch_book_image_use_case.dart';
import 'package:iread/features/home/presentation/manager/cubit/fetch_book_image_cubit.dart';
import 'package:iread/main.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.selectedBook});
  final File selectedBook;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchBookImageCubit(
          FetchBookImageUseCase(homeRepo: getIt.get<HomeRepoImplementation>()))
        ..fetchBookImage(selectedBook.path),
      child: BlocConsumer<FetchBookImageCubit, FetchBookImageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FetchBookImageLoaded) {
            return InkWell(
              onTap: () {
                // GoRouter.of(context)
                //    .push(AppRouter.kBookDetails, extra: selectedEntity);
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                    color: kListItemColor,
                    borderRadius: BorderRadius.circular(15)),
                //width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2.8 / 3,
                      child: state.image.isEmpty
                          ? Image.asset(AssetsPath.testBookPath,
                              fit: BoxFit.fill)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                                  Image.memory(state.image, fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        selectedBook.uri.pathSegments.last,
                        style: Styles.textStyle18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is FetchBookImageFailure) {
            return const Icon(
              Icons.error,
              color: Colors.red,
            );
          }
          return const Center(
            child: SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
