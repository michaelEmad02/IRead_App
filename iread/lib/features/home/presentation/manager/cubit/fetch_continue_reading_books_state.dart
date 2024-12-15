part of 'fetch_continue_reading_books_cubit.dart';

@immutable
sealed class FetchContinueReadingBooksState {}

final class FetchContinueReadingBooksInitial
    extends FetchContinueReadingBooksState {}

final class FetchContinueReadingBooksLoading
    extends FetchContinueReadingBooksState {}

final class FetchContinueReadingBookLoaded
    extends FetchContinueReadingBooksState {
  final List<BookStatusEntity> books;

  FetchContinueReadingBookLoaded({required this.books});
}

final class FetchContinueReadingBooksFailure
    extends FetchContinueReadingBooksState {
  final String errorMessage;

  FetchContinueReadingBooksFailure({required this.errorMessage});
}
