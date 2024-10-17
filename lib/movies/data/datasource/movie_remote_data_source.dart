import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/network/error_message_model.dart';
import 'package:movia_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failuer, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failuer, List<MovieModel>>> getNowPopularMovies();
  Future<Either<Failuer, List<MovieModel>>> getNowTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<Either<Failuer, List<MovieModel>>> getNowPlayingMovies() async {
    
    try {
      var response = await Dio().get(ApiConstant.nowPlayingMovie);
      if (response.data['results'] != null) {
        List<MovieModel>.from((response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item)));
        return Right(response.data);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "UnxpectedError"));
    }
  }

  @override

  Future<Either<Failuer, List<MovieModel>>> getNowPopularMovies() async {
    
    try {
      var response = await Dio().get(ApiConstant.popularMovie);
      if (response.data['results'] != null) {
        List<MovieModel>.from((response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item)));
        return Right(response.data);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "UnxpectedError"));
    }
  }

  @override
 Future<Either<Failuer, List<MovieModel>>> getNowTopRatedMovies() async {

    try {
      var response = await Dio().get(ApiConstant.topRatedMovie);
      if (response.data['results'] != null) {
        List<MovieModel>.from((response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item)));
        return Right(response.data);
      } else {
        return Left(ServerFailure(errMessage: "No Movies found"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: "UnxpectedError"));
    }
  }
}
