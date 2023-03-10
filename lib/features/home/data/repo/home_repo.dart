import 'package:bookShelf/core/error/error_handling.dart';
import 'package:bookShelf/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<ErrorHandling,List<BookModel>>> fetchNewestBooks();
  Future<Either<ErrorHandling,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<ErrorHandling,List<BookModel>>> fetchSimilarBooks({required String category});
}