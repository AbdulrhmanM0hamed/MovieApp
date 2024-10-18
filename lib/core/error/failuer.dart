import 'package:dio/dio.dart';

abstract class Failuer {
  final String errMessage;

  Failuer({required this.errMessage});
}

class ServerFailure extends Failuer {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive Timeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      default:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure(errMessage: "No Internet Connection");
        }
        return ServerFailure(errMessage: "Unexpected Error , PLease Try Later");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response["status_message"]);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: "Requset Not Found , Please try later");
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: "Internal server error, Please try later");
    } else {
      return ServerFailure(
          errMessage: "Opps There was an error, Please try later");
    }
  }
}
