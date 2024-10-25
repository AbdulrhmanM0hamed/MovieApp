import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movia_app/core/utils/enums.dart';

import 'package:movia_app/movies/domain/entities/movie.dart';

import 'package:movia_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>  {

final  GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase ; 

  MoviesBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState())  {
    on<GetNowPlayingMoviesEvent>((event, emit) async {

   
  final result = await getNowPlayingMoviesUsecase.excute();

          result.fold((failure){
            emit(MoviesState(nowPlayingMessage: failure.errMessage , nowPlayingstate: RequestState.error));
          }, (movies){
            emit(MoviesState(nowPlayingMovies: movies , nowPlayingstate: RequestState.loaded ,)) ;
          });

    });
  }
}
