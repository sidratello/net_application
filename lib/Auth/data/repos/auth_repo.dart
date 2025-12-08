import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/error/falures.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> fetchdatasignup({
    required String FullName,
    required dynamic password,
    required dynamic ConfirmPassword,
    required String Email,
  });
  Future<Either<Failure, Map<String, dynamic>>> fetchdataotp({
    required String code,
    required String Email,
  });

  Future<Either<Failure, Map<String, dynamic>>> fetchdataresendotp({
    required String Email,
  });

  Future<Either<Failure, Map<String, dynamic>>> fetchdatalogin({
    required dynamic password,
    required String Email,
  });
}
