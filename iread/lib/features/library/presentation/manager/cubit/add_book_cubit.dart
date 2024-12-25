import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/add_book_use_case.dart';
import 'package:meta/meta.dart';

part 'add_book_state.dart';

class AddBookCubit extends Cubit<AddBookState> {
  AddBookCubit(this.addBookUseCase) : super(AddBookInitial());

  final AddBookUseCase addBookUseCase;

  Future<void> addBook(BookStatusEntity book) async {
    emit(AddBookLoading());
    var result = await addBookUseCase.execute(book);
    result.fold(
        (failure) => emit(AddBookFailure(errorMessage: failure.errorMessage)),
        (success) => emit(AddBookSuccess()));
  }
}
