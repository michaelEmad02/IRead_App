import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/fetch_to_read_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_to_read_books_state.dart';

class FetchToReadBooksCubit extends Cubit<FetchToReadBooksState> {
  FetchToReadBooksCubit(this.fetchToReadBooksUseCase)
      : super(FetchToReadBooksInitial());

  final FetchToReadBooksUseCase fetchToReadBooksUseCase;

  Future<void> fetchToReadBooks() async {
    emit(FetchToReadBooksLoading());
    var result = await fetchToReadBooksUseCase.execute();
    result.fold(
        (failure) =>
            emit(FetchToReadBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchToReadBooksILoaded(books: books)));
  }
}
