part of 'manage_library_books_cubit.dart';

@immutable
sealed class ManageLibryaryBooksState {}

final class ManageLibraryBooksInitial extends ManageLibryaryBooksState {}

final class ManageLibraryBooksLoading extends ManageLibryaryBooksState {}

final class ManageLibraryBooksSuccess extends ManageLibryaryBooksState {}

final class ManageLibraryBooksFailure extends ManageLibryaryBooksState {
  final String errorMessage;

  ManageLibraryBooksFailure({required this.errorMessage});
}
