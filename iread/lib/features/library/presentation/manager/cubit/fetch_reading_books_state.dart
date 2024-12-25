part of 'fetch_reading_books_cubit.dart';

@immutable
sealed class FetchReadingBooksState {}

final class FetchReadingBooksInitial extends FetchReadingBooksState {}

final class FetchReadingBooksLoading extends FetchReadingBooksState {}

final class FetchReadingBooksILoaded extends FetchReadingBooksState {
  final List<BookStatusEntity> books;

  FetchReadingBooksILoaded({required this.books});
}

final class FetchReadingBooksFailure extends FetchReadingBooksState {
  final String errorMessage;

  FetchReadingBooksFailure({required this.errorMessage});
}
