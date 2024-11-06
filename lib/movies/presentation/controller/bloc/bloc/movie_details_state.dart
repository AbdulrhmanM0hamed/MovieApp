part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  
  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}
final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  
  final Detials detials ;

  const MovieDetailsSuccess({required this.detials}); 

}


final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage ;

  const MovieDetailsFailure({required this.errMessage});
}

