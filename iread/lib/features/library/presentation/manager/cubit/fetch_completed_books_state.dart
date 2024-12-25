part of 'fetch_completed_books_cubit.dart';

@immutable
sealed class FetchCompletedBooksState {}

final class FetchCompletedBooksInitial extends FetchCompletedBooksState {}

final class FetchCompletedBooksLoading extends FetchCompletedBooksState {}

final class FetchCompletedBooksLoaded extends FetchCompletedBooksState {
  final List<BookStatusEntity> books;

  FetchCompletedBooksLoaded({required this.books});
}

final class FetchCompletedBooksFailure extends FetchCompletedBooksState {
  final String errorMessage;

  FetchCompletedBooksFailure({required this.errorMessage});
}
