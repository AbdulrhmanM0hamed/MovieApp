part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}


class GetDetailsEvent extends MovieDetailsEvent {

  final int movieId;

  const GetDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}