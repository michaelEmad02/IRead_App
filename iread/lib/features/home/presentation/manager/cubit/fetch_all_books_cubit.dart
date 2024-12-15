import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/use_cases/fetch_all_books_use_case.dart';

part 'fetch_all_books_state.dart';

class FetchAllBooksCubit extends Cubit<FetchAllBooksState> {
  FetchAllBooksCubit(this.fetchAllBooksUseCase) : super(FetchAllBooksInitial());

  final FetchAllBooksUseCase fetchAllBooksUseCase;

  Future<void> fetchAllBooks() async {
    emit(FetchAllBooksLoading());
    var result = await fetchAllBooksUseCase.execute();
    result.fold(
        (failure) =>
            emit(FetchAllBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchAllBooksLoaded(books: books)));
  }
}
