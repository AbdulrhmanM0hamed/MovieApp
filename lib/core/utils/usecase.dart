import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';

abstract class BaseUsecase<T> {
 
 Future<Either<Failuer , T>> call() ; 

}