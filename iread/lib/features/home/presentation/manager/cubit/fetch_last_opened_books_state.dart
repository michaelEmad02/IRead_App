part of 'fetch_last_opened_books_cubit.dart';

@immutable
sealed class FetchLastOpenedBooksState {}

final class FetchLastOpenedBooksInitial extends FetchLastOpenedBooksState {}

final class FetchLastOpenedBooksLoading extends FetchLastOpenedBooksState {}

final class FetchLastOpenedBooksLoaded extends FetchLastOpenedBooksState {
  final List<BookEntity> books;

  FetchLastOpenedBooksLoaded({required this.books});
}

final class FetchLastOpenedBooksFailure extends FetchLastOpenedBooksState {
  final String errorMessage;

  FetchLastOpenedBooksFailure({required this.errorMessage});
}
