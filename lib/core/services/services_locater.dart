
import 'package:get_it/get_it.dart';
import 'package:movia_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movia_app/movies/data/repository/movies_repository.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movia_app/movies/presentation/controller/bloc/moivess_bloc.dart';

import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';


final sl = GetIt.instance ;
class ServicesLocater {

  void init(){

    
     sl.registerFactory( () => MoivessBloc(sl())) ;


    // Use Case

       sl.registerLazySingleton( () => GetNowPlayingMoviesUsecase(baseMovieRepository: sl())  ) ;

    // Repository 
        
     sl.registerLazySingleton<BaseMovieRepository>( () => MoviesRepository(baseMovieRemoteDataSource: sl() ) ) ;    
   
     // data source 
     sl.registerLazySingleton<BaseMovieRemoteDataSource>( () => MovieRemoteDataSource() ); 

  }


  
}