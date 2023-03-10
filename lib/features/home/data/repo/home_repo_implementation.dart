import 'package:bookShelf/core/api_services.dart';
import 'package:bookShelf/core/error/error_handling.dart';
import 'package:bookShelf/features/home/data/models/book_model.dart';
import 'package:bookShelf/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<ErrorHandling, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ErrorHandling, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:programming");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ErrorHandling, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
