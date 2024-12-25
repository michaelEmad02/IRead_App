part of 'fetch_to_read_books_cubit.dart';

@immutable
sealed class FetchToReadBooksState {}

final class FetchToReadBooksInitial extends FetchToReadBooksState {}

final class FetchToReadBooksLoading extends FetchToReadBooksState {}

final class FetchToReadBooksILoaded extends FetchToReadBooksState {
  final List<BookStatusEntity> books;

  FetchToReadBooksILoaded({required this.books});
}

final class FetchToReadBooksFailure extends FetchToReadBooksState {
  final String errorMessage;

  FetchToReadBooksFailure({required this.errorMessage});
}
