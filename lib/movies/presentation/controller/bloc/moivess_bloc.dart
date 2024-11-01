import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movia_app/movies/domain/entities/movie.dart';
import 'package:movia_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

part 'moivess_event.dart';
part 'moivess_state.dart';

class MoivessBloc extends Bloc<MoivessEvent, MoivessState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase ;
  MoivessBloc(this.getNowPlayingMoviesUsecase) : super( MoivesNowPlayingInitial()) {
    on<MoivessEvent>((event, emit) async {

     final result = await getNowPlayingMoviesUsecase.excute() ; 
       
       result.fold((failure){
           
           emit(MoivessNowPlayingFailure(errMessage: failure.errMessage));
       }, (movies){

        emit(MoivessNowPlayingSuccess(movie: movies)) ;

       })
;        
    });
  }
}
