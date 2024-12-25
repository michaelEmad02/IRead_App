part of 'update_book_cubit.dart';

@immutable
sealed class UpdateBookState {}

final class UpdateBookInitial extends UpdateBookState {}

final class UpdateBookLoading extends UpdateBookState {}

final class UpdateBookSuccess extends UpdateBookState {}

final class UpdateBookFailure extends UpdateBookState {
  final String errorMessage;

  UpdateBookFailure({required this.errorMessage});
}
