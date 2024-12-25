part of 'remove_book_cubit.dart';

@immutable
sealed class RemoveBookState {}

final class RemoveBookInitial extends RemoveBookState {}

final class RemoveBookLoading extends RemoveBookState {}

final class RemoveBookSuccess extends RemoveBookState {}

final class RemoveBookFailure extends RemoveBookState {
  final String errorMessage;

  RemoveBookFailure({required this.errorMessage});
}
