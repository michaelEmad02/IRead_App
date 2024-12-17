part of 'fetch_all_books_cubit.dart';

@immutable
sealed class FetchAllBooksState {}

final class FetchAllBooksInitial extends FetchAllBooksState {}

final class FetchAllBooksLoading extends FetchAllBooksState {}

final class FetchAllBooksLoaded extends FetchAllBooksState {
  final List<File> books;

  FetchAllBooksLoaded({required this.books});
}

final class FetchAllBooksFailure extends FetchAllBooksState {
  final String errorMessage;

  FetchAllBooksFailure({required this.errorMessage});
}
