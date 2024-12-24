import 'package:dartz/dartz.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/core/use_cases/use_case.dart';
import 'package:iread/features/home/domain/repositories/home_repo.dart';

class FetchContinueReadingBooksUseCase extends UseCase<List<BookStatusEntity>> {
  final HomeRepo homeRepo;

  FetchContinueReadingBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookStatusEntity>>> execute() {
    return homeRepo.fetchContinueReadingBooks();
  }
}
