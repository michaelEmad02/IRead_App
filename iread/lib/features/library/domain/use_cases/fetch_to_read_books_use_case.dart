import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/core/use_cases/use_case.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/features/library/domain/repositories/library_repo.dart';

class FetchToReadBooksUseCase extends UseCase<List<BookStatusEntity>> {
  final LibraryRepo libraryRepo;

  FetchToReadBooksUseCase({required this.libraryRepo});
  @override
  Future<Either<Failure, List<BookStatusEntity>>> execute() {
    return libraryRepo.fetchToReadBooks();
  }
}
