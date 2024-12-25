import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/add_book_use_case.dart';
import 'package:iread/features/library/domain/use_cases/remove_book_use_case.dart';
import 'package:iread/features/library/domain/use_cases/update_book_use_case.dart';
import 'package:meta/meta.dart';

part 'manage_library_books_state.dart';

class ManageLibraryBooksCubit extends Cubit<ManageLibryaryBooksState> {
  ManageLibraryBooksCubit(
      {required this.addBookUseCase,
      required this.removeBookUseCase,
      required this.updateBookUseCase})
      : super(ManageLibraryBooksInitial());

  final AddBookUseCase addBookUseCase;

  final RemoveBookUseCase removeBookUseCase;

  final UpdateBookUseCase updateBookUseCase;

  Future<void> addBook(BookStatusEntity book) async {
    emit(ManageLibraryBooksLoading());
    var result = await addBookUseCase.execute(book);
    result.fold(
        (failure) =>
            emit(ManageLibraryBooksFailure(errorMessage: failure.errorMessage)),
        (success) => emit(ManageLibraryBooksSuccess()));
  }

  Future<void> updateBook(BookStatusEntity book) async {
    emit(ManageLibraryBooksLoading());
    var result = await updateBookUseCase.execute(book);
    result.fold(
        (failure) =>
            emit(ManageLibraryBooksFailure(errorMessage: failure.errorMessage)),
        (success) => emit(ManageLibraryBooksSuccess()));
  }

  Future<void> removeBook(BookStatusEntity book) async {
    emit(ManageLibraryBooksLoading());
    var result = await removeBookUseCase.execute(book);
    result.fold(
        (failure) =>
            emit(ManageLibraryBooksFailure(errorMessage: failure.errorMessage)),
        (success) => emit(ManageLibraryBooksSuccess()));
  }
}
