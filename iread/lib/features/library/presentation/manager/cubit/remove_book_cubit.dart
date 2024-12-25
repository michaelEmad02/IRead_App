import 'package:bloc/bloc.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/use_cases/remove_book_use_case.dart';
import 'package:meta/meta.dart';

part 'remove_book_state.dart';

class RemoveBookCubit extends Cubit<RemoveBookState> {
  RemoveBookCubit(this.removeBookUseCase) : super(RemoveBookInitial());

  final RemoveBookUseCase removeBookUseCase;

  Future<void> removeBook(BookStatusEntity book) async {
    emit(RemoveBookLoading());
    var result = await removeBookUseCase.execute(book);
    result.fold(
        (failure) =>
            emit(RemoveBookFailure(errorMessage: failure.errorMessage)),
        (success) => emit(RemoveBookSuccess()));
  }
}
