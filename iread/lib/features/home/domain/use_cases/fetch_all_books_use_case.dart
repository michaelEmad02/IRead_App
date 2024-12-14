import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/core/use_cases/use_case.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/repositories/home_repo.dart';

class FetchAllBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchAllBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute() {
    return homeRepo.fetchAllBooks();
  }
}
