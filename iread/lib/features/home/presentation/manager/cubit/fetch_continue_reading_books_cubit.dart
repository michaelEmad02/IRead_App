import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';
import 'package:iread/features/home/domain/use_cases/fetch_continue_reading_books_use_case.dart';

part 'fetch_continue_reading_books_state.dart';

class FetchContinueReadingBooksCubit
    extends Cubit<FetchContinueReadingBooksState> {
  FetchContinueReadingBooksCubit(this.fetchContinueReadingBooksUseCase)
      : super(FetchContinueReadingBooksInitial());

  final FetchContinueReadingBooksUseCase fetchContinueReadingBooksUseCase;

  Future<void> fetchContinueReadingBook() async {
    emit(FetchContinueReadingBooksLoading());
    var result = await fetchContinueReadingBooksUseCase.execute();
    result.fold(
      (failure) => emit(
          FetchContinueReadingBooksFailure(errorMessage: failure.errorMessage)),
      (books) {
        emit(FetchContinueReadingBookLoaded(books: books));
      },
    );
  }
}
