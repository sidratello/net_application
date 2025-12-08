import 'dart:io';


import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException  dioError) {
       print('================ DioException ================');
    print('type: ${dioError.type}');
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);  //call the factory constructer  fromResponce 
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioError.message is SocketException) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    
    print("DEBUG RESPONSE: $response");



    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {

      if (response is Map<String, dynamic>) {
         // { "message": "User not found." }
        // { "message": "OTP invalid or expired." }
        // { "message": "Email already registered." }
        if (response["message"] != null) {
      final res=response["message"].toString();
      print("🔥 Backend Message: $res");
          return ServerFailure(res);
        }

 // "errors": { "Email": ["The Email field is required."] }
        // "errors": { "Code": ["The Code field is required."] }
        if (response["errors"] != null && response["errors"] is Map) {
          final errors = response["errors"] as Map;
     if (errors.isNotEmpty) {
          final firstEntry = errors.entries.first;
          final value = firstEntry.value;
          if (value is List && value.isNotEmpty) {
            final msg = value.last.toString();
            print("🔥 Backend Message: $msg");
            return ServerFailure(msg);
          }

     else {
            final msg = value.toString();
            print("🔥 Backend Message: $msg");
            return ServerFailure(msg);
          }
        }
      }


    }
    }
    // 🔹 Other status codes
    if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}