import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/movies/domain/entities/detials.dart';

abstract class BaseMovieDetailsRepository {

  Future<Either<Failuer , Detials>> getMovieDetial (int id) ;
  
}