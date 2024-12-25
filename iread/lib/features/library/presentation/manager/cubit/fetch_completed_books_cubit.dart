import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/fetch_completed_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_completed_books_state.dart';

class FetchCompletedBooksCubit extends Cubit<FetchCompletedBooksState> {
  FetchCompletedBooksCubit(this.fetchCompletedBooksUseCase)
      : super(FetchCompletedBooksInitial());

  final FetchCompletedBooksUseCase fetchCompletedBooksUseCase;

  Future<void> fetchToReadBooks() async {
    emit(FetchCompletedBooksLoading());
    var result = await fetchCompletedBooksUseCase.execute();
    result.fold(
        (failure) =>
            emit(FetchCompletedBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchCompletedBooksLoaded(books: books)));
  }
}
