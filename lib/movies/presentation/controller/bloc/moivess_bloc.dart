import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movia_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movia_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movia_app/movies/presentation/controller/bloc/moivess_state.dart';

part 'moivess_event.dart';

class MoivessBloc extends Bloc<MoivessEvent, MoivessState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoivessBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(MoivesInitial()) 
  
  {


    // Now Playing Movies
    on<GetNowPlayingMoviessEvent>((event, emit) async {
      emit(MoivessNowPlayingLoading());
      final result = await getNowPlayingMoviesUsecase();
      result.fold(
        (failure) => emit(MoivessNowPlayingFailure(errorMessage: failure.errMessage)),
        (movies) => emit(MoivessNowPlayingSuccess(movies: movies)),
      );
    });


    // Popular Movies
    on<GetNowPopularMoviessEvent>((event, emit) async {
      emit(MoivessPopularLoading());
      final result = await getPopularMoviesUsecase();
      result.fold(
        (failure) => emit(MoivessPopularFailure(errorMessage: failure.errMessage)),
        (movies) => emit(MoivessPopularSuccess(movies: movies)),
      );
    });

    // Top Rated Movies
    on<GetNowTopRatedMoviessEvent>((event, emit) async {
      emit(MoivessTopRatedLoading());
      final result = await getTopRatedMoviesUsecase();
      result.fold(
        (failure) => emit(MoivessTopRatedFailure(errorMessage: failure.errMessage)),
        (movies) => emit(MoivessTopRatedSuccess(movies: movies)),
      );
    });
  }
}
