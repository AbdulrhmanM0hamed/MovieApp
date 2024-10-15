import 'package:movia_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {

Future<List<Movie>> getNowPlaying();
Future<List<Movie>> getPopularMovies();
Future<List<Movie>> getTopRatedMovies();

  
}