part of 'movies_bloc.dart';

 class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingstate;
  final String nowPlayingMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingstate = RequestState.loading,
      this.nowPlayingMessage = ''});

  @override
  List<Object> get props => [nowPlayingMovies, nowPlayingstate, nowPlayingMessage];
}
