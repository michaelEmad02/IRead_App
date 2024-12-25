import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/update_book_use_case.dart';
import 'package:meta/meta.dart';

part 'update_book_state.dart';

class UpdateBookCubit extends Cubit<UpdateBookState> {
  UpdateBookCubit(this.updateBookUseCase) : super(UpdateBookInitial());
  final UpdateBookUseCase updateBookUseCase;

  Future<void> updateBook(BookStatusEntity book) async {
    emit(UpdateBookLoading());
    var result = await updateBookUseCase.execute(book);
    result.fold(
        (failure) =>
            emit(UpdateBookFailure(errorMessage: failure.errorMessage)),
        (success) => emit(UpdateBookSuccess()));
  }
}
