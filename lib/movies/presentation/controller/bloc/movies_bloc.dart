import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movia_app/core/utils/enums.dart';
import 'package:movia_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movia_app/movies/data/repository/movies_repository.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movia_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>  {

  MoviesBloc() : super(const MoviesState())  {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository = MoviesRepository(
          baseMovieRemoteDataSource: baseMovieRemoteDataSource);
  final result = await  GetNowPlayingMoviesUsecase(baseMovieRepository: baseMovieRepository)
          .excute();

          result.fold((failure){
            emit(MoviesState(nowPlayingMessage: failure.errMessage , nowPlayingstate: RequestState.error));
          }, (movies){
            emit(MoviesState(nowPlayingMovies: movies , nowPlayingstate: RequestState.loaded ,)) ;
          });

    });
  }
}
