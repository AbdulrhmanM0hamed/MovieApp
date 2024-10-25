import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';

import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUsecase({required this.baseMovieRepository});

  Future<Either <Failuer , List<Movie>>> excute() async {
    return await baseMovieRepository.getNowPlaying();
  }
}
