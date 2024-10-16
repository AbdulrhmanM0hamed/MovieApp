import 'package:dio/dio.dart';
import 'package:movia_app/core/error/exceptions.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/network/error_message_model.dart';
import 'package:movia_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies() ;
  Future<List<MovieModel>> getNowPopularMovies() ; 
  Future<List<MovieModel>> getNowTopRatedMovies() ; 
 
 
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstant.nowPlayingMovie);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<MovieModel>> getNowPopularMovies() async {

     var response = await Dio().get(ApiConstant.popularMovie);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  
  @override
  Future<List<MovieModel>> getNowTopRatedMovies() async {

     var response = await Dio().get(ApiConstant.topRatedMovie);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

    
    
  }
}
