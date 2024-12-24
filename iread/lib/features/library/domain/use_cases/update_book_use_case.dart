import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/core/use_cases/use_case_one_param.dart';
import 'package:iread/features/library/domain/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/repositories/library_repo.dart';

class UpdateBookUseCase extends UseCase<void, BookStatusEntity> {
  final LibraryRepo libraryRepo;

  UpdateBookUseCase({required this.libraryRepo});
  @override
  Future<Either<Failure, void>> execute(BookStatusEntity param) {
    return libraryRepo.updateBook(book: param);
  }
}
