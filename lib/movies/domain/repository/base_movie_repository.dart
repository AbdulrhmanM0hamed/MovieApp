import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {

Future<Either<Failuer , List<Movie>>> getNowPlaying();
Future<Either<Failuer , List<Movie>>> getPopularMovies();
Future<Either<Failuer , List<Movie>>> getTopRatedMovies();

  
}