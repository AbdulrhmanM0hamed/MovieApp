import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failuer, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failuer, List<MovieModel>>> getPopularMovies();
  Future<Either<Failuer, List<MovieModel>>> getTopRatedMovies();
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<Failuer, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var response = await Dio().get(ApiConstant.nowPlayingMovie);
      if (response.data['results'] != null) {
        List<MovieModel> movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item))
            .toList();
          
        return Right(movies);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "Unexpected Error"));
    }
  }

  @override
  Future<Either<Failuer, List<MovieModel>>> getPopularMovies() async {
    try {
      var response = await Dio().get(ApiConstant.popularMovie);
      if (response.data['results'] != null) {
        List<MovieModel> movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item))
            .toList();
        return Right(movies);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "Unexpected Error"));
    }
  }

  @override
  Future<Either<Failuer, List<MovieModel>>> getTopRatedMovies() async {
    try {
      var response = await Dio().get(ApiConstant.topRatedMovie);
      if (response.data['results'] != null) {
        List<MovieModel> movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item))
            .toList();
        return Right(movies);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "Unexpected Error"));
    }
  }
}
