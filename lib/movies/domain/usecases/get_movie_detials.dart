import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/core/utils/usecase.dart';
import 'package:movia_app/movies/domain/entities/detials.dart';
import 'package:movia_app/movies/domain/repository/base_movie_details.dart';

class GetMovieDetialsUseCase  {
      final BaseMovieDetailsRepository baseMovieDetailsRepository ;

  GetMovieDetialsUseCase({required this.baseMovieDetailsRepository});

      Future<Either<Failuer ,Detials>> call(int id) async{
        return await baseMovieDetailsRepository.getMovieDetial(id) ;

      }
   
  }

  
