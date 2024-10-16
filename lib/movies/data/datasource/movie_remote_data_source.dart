import 'package:dio/dio.dart';
import 'package:movia_app/core/error/exceptions.dart';
import 'package:movia_app/core/network/error_message_model.dart';
import 'package:movia_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/popular?api_key=d60b9f804ecce3ed1cab1ae54e43ed31");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
