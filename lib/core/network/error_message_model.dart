
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessaage;

  const ErrorMessageModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessaage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessaage: json["status_message"]);
  }

  @override
  List<Object?> get props => [
        success,
        statusCode,
        statusMessaage,
      ];
}
