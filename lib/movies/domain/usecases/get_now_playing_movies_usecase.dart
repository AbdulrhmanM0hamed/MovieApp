import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/core/utils/usecase.dart';

import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUsecase({required this.baseMovieRepository});
     
     @override
   Future<Either <Failuer , List<Movie>>> call() async {
    return await baseMovieRepository.getNowPlaying();
  }
}
