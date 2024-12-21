import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:iread/core/errors/failure.dart';
import 'package:iread/features/home/data/data_sources/home_local_data_source.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/entities/book_status_entity.dart';
import 'package:iread/features/home/domain/repositories/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<File>>> fetchAllBooksFiles() async {
    try {
      var result = await homeLocalDataSource.fetchAllBooksPaths();

      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookStatusEntity>>>
      fetchContinueReadingBooks() async {
    try {
      var result = await homeLocalDataSource.fetchContinueReadingBooks();

      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchLastOpennedBooks() async {
    try {
      var result = await homeLocalDataSource.fetchLastOpennedBooks();

      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Uint8List>> fetchBookImage(String filePath) async {
    try {
      var result = await homeLocalDataSource.fetchBookImage(filePath);

      return right(result);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
