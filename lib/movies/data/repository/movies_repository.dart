import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMovieRepository {
 
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failuer, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    return result.fold(
      (failure) => Left(ServerFailure(errMessage: "Unexpected Error")),
      (movieModels) {
        List<Movie> movies = movieModels.map((model) => model as Movie).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failuer, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    return result.fold(
      (failure) => Left(ServerFailure(errMessage: "Unexpected Error")),
      (movieModels) {
        List<Movie> movies = movieModels.map((model) => model as Movie).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failuer, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    return result.fold(
      (failure) => Left(ServerFailure(errMessage: "Unexpected Error")),
      (movieModels) {
        List<Movie> movies = movieModels.map((model) => model as Movie).toList();
        return Right(movies);
      },
    );
  }
}
