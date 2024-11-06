
import 'package:get_it/get_it.dart';
import 'package:movia_app/movies/data/datasource/details_remote_data_source.dart';
import 'package:movia_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movia_app/movies/data/repository/details_repository.dart';
import 'package:movia_app/movies/data/repository/movies_repository.dart';
import 'package:movia_app/movies/domain/repository/base_movie_details.dart';
import 'package:movia_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movia_app/movies/domain/usecases/get_movie_detials.dart';
import 'package:movia_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movia_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movia_app/movies/presentation/controller/bloc/bloc/movie_details_bloc.dart';
import 'package:movia_app/movies/presentation/controller/bloc/moivess_bloc.dart';

import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';


final sl = GetIt.instance ;
class ServicesLocater {

  void init(){

    
     sl.registerFactory( () => MoivessBloc(sl() , sl() , sl())) ;
    sl.registerFactory( () => MovieDetailsBloc(sl())) ;



    // Use Case

       sl.registerLazySingleton( () => GetNowPlayingMoviesUsecase(baseMovieRepository: sl()) ) ;

       sl.registerLazySingleton( () => GetPopularMoviesUsecase(baseMovieRepository: sl()) ) ;
       sl.registerLazySingleton( () => GetTopRatedMoviesUsecase(baseMovieRepository: sl()) ) ;




      sl.registerLazySingleton( () => GetMovieDetialsUseCase (baseMovieDetailsRepository:sl()  ) ) ;
      sl.registerLazySingleton<BaseMovieDetailsRepository>(  () => DetailsRepository (baseDetailsRemoteDataSource:  sl()  ) ) ;
      sl.registerLazySingleton<BaseDetailsRemoteDataSource>( () => DetailsRemoteDataSource ( ) ) ;




    // Repository 
        
     sl.registerLazySingleton<BaseMovieRepository>( () => MoviesRepository(baseMovieRemoteDataSource: sl() ) ) ;    
   
     // data source 
     sl.registerLazySingleton<BaseMovieRemoteDataSource>( () => MovieRemoteDataSource() ); 

  }


  
}