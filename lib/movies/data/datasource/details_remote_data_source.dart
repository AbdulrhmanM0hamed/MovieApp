import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/movies/data/models/details_model.dart';

abstract class BaseDetailsRemoteDataSource {
  Future<Either<Failuer, DetailsModel>> getMovieDetails(int id);
}

class DetailsRemoteDataSource extends BaseDetailsRemoteDataSource {
 @override
Future<Either<Failuer, DetailsModel>> getMovieDetails(int id) async {
  try {
    var response = await Dio().get(ApiConstant.detialsUrl(id));

    if (response.data != null) {
      DetailsModel details = DetailsModel.fromJson(response.data);
      return Right(details);
    } else {
      return Left(ServerFailure(errMessage: "No details found"));
    }
  } catch (e) {
    if (e is DioException) {
      return Left(ServerFailure.fromDioError(e));
    }
    return Left(ServerFailure(errMessage: "Unexpected error: ${e.toString()}"));
  }
}

}
