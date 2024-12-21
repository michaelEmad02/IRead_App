import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/core/use_cases/use_case_one_param.dart';
import 'package:iread/features/home/domain/repositories/home_repo.dart';

class FetchBookImageUseCase extends UseCase<Uint8List, String> {
  final HomeRepo homeRepo;

  FetchBookImageUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, Uint8List>> execute(String param) {
    return homeRepo.fetchBookImage(param);
  }
}
