import 'package:dartz/dartz.dart';
import 'package:movia_app/core/error/failuer.dart';
import 'package:movia_app/movies/data/datasource/details_remote_data_source.dart';
import 'package:movia_app/movies/domain/entities/detials.dart';
import 'package:movia_app/movies/domain/repository/base_movie_details.dart';

class DetailsRepository extends BaseMovieDetailsRepository {
  final BaseDetailsRemoteDataSource baseDetailsRemoteDataSource;

  DetailsRepository({required this.baseDetailsRemoteDataSource});

  @override
  Future<Either<Failuer, Detials>> getMovieDetial(int id) async {
    final result = await baseDetailsRemoteDataSource.getMovieDetails(id);

    return result.fold(
      (failure) => Left(ServerFailure(errMessage: "Unexpected Error")),
      (detailsModel) {
        return Right(detailsModel.toEntity());
      },
    );
  }
}
