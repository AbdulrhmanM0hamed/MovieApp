part of 'movies_bloc.dart';


abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}
class GetNowPopularMoviesEvent extends MoviesEvent {}
class GetNowTopRatedMoviesEvent extends MoviesEvent {}