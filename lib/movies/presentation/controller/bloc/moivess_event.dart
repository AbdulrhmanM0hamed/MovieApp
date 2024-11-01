part of 'moivess_bloc.dart';

sealed class MoivessEvent extends Equatable {
  const MoivessEvent();

  @override
  List<Object> get props => [];
}


class GetNowPlayingMoviessEvent extends MoivessEvent {}
class GetNowPopularMoviessEvent extends MoivessEvent {}
class GetNowTopRatedMoviessEvent extends MoivessEvent {}