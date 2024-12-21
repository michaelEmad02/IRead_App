import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:iread/constants.dart';
import 'package:iread/features/home/domain/use_cases/fetch_book_image_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_book_image_state.dart';

class FetchBookImageCubit extends Cubit<FetchBookImageState> {
  FetchBookImageCubit(this.fetchBookImageUseCase)
      : super(FetchBookImageInitial());

  final FetchBookImageUseCase fetchBookImageUseCase;
  final Box<Uint8List> _box = Hive.box<Uint8List>(kBookImageBox);
  Future<void> fetchBookImage(String filePath) async {
    if (_box.containsKey(filePath)) {
      emit(FetchBookImageLoaded(image: _box.get(filePath)!));
    } else {
      emit(FetchBookImageLoading());
      var result = await fetchBookImageUseCase.execute(filePath);
      result.fold(
          (failure) =>
              emit(FetchBookImageFailure(errorMessage: failure.errorMessage)),
          (image) async {
        await _box.put(filePath, image);
        if (isClosed) {
          FetchBookImageInitial();
          emit(FetchBookImageLoading());
        }
        emit(FetchBookImageLoaded(image: image));
      });
    }
  }
}
