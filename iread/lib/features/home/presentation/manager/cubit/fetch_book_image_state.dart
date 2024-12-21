part of 'fetch_book_image_cubit.dart';

@immutable
sealed class FetchBookImageState {}

final class FetchBookImageInitial extends FetchBookImageState {}

final class FetchBookImageLoading extends FetchBookImageState {}

final class FetchBookImageLoaded extends FetchBookImageState {
  final Uint8List image;

  FetchBookImageLoaded({required this.image});

  
}

final class FetchBookImageFailure extends FetchBookImageState {
  final String errorMessage;

  FetchBookImageFailure({required this.errorMessage});
}
