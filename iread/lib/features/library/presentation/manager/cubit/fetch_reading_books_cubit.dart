import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/fetch_reading_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_reading_books_state.dart';

class FetchReadingBooksCubit extends Cubit<FetchReadingBooksState> {
  FetchReadingBooksCubit(this.fetchReadingBooksUseCase)
      : super(FetchReadingBooksInitial());
  final FetchReadingBooksUseCase fetchReadingBooksUseCase;

  Future<void> fetchReadingBooks() async {
    emit(FetchReadingBooksLoading());
    var result = await fetchReadingBooksUseCase.execute();
    result.fold(
        (failure) =>
            emit(FetchReadingBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchReadingBooksILoaded(books: books)));
  }
}
