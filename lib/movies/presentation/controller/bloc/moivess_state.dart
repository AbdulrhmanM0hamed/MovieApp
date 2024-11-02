import 'package:equatable/equatable.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';

sealed class MoivessState extends Equatable {
  const MoivessState();
  
  @override
  List<Object> get props => [];
}

final class MoivesInitial extends MoivessState {}

// Now Playing States
final class MoivessNowPlayingLoading extends MoivessState {}
final class MoivessNowPlayingSuccess extends MoivessState {
  final List<Movie> movies;
  MoivessNowPlayingSuccess({required this.movies});
}
final class MoivessNowPlayingFailure extends MoivessState {

  final String errorMessage;
  MoivessNowPlayingFailure({required this.errorMessage});
  
}

// Popular States
final class MoivessPopularLoading extends MoivessState {}
final class MoivessPopularSuccess extends MoivessState {
  final List<Movie> movies;
  MoivessPopularSuccess({required this.movies});
}
final class MoivessPopularFailure extends MoivessState {
  final String errorMessage;
  MoivessPopularFailure({required this.errorMessage});
}

// Top Rated States
final class MoivessTopRatedLoading extends MoivessState {}
final class MoivessTopRatedSuccess extends MoivessState {
  final List<Movie> movies;
  MoivessTopRatedSuccess({required this.movies});
}
final class MoivessTopRatedFailure extends MoivessState {
  final String errorMessage;
  MoivessTopRatedFailure({required this.errorMessage});
}
