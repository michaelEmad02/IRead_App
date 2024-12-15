import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/use_cases/fetch_last_opened_books_use_case.dart';

part 'fetch_last_opened_books_state.dart';

class FetchLastOpenedBooksCubit extends Cubit<FetchLastOpenedBooksState> {
  FetchLastOpenedBooksCubit(this.fetchLastOpenedBooksUseCase)
      : super(FetchLastOpenedBooksInitial());
  final FetchLastOpenedBooksUseCase fetchLastOpenedBooksUseCase;

  Future<void> fetchLastOpenedBooks() async {
    emit(FetchLastOpenedBooksLoading());
    var result = await fetchLastOpenedBooksUseCase.execute();
    result.fold(
        (failure) => emit(
            FetchLastOpenedBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchLastOpenedBooksLoaded(books: books)));
  }
}
