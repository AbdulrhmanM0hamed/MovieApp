part of 'moivess_bloc.dart';

sealed class MoivessState extends Equatable {
  const MoivessState();
  
  @override
  List<Object> get props => [];
}

final class MoivesNowPlayingInitial extends MoivessState {}

final class MoivesNowPlayingLoading extends MoivessState {}


final class MoivessNowPlayingSuccess extends MoivessState {

  final List<Movie>  movie ;


  MoivessNowPlayingSuccess({required this.movie});}

final class MoivessNowPlayingFailure extends MoivessState {

  final String errMessage ;

  MoivessNowPlayingFailure({required this.errMessage}); 


}


