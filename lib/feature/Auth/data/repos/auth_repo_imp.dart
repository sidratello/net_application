
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:net_aplecation/core/api_serveses.dart';
import 'package:net_aplecation/core/error/falures.dart';
import 'package:net_aplecation/core/units/server_locater.dart';
import 'package:net_aplecation/feature/Auth/data/repos/auth_repo.dart';
import 'package:net_aplecation/singlr_servese.dart';

import 'package:shared_preferences/shared_preferences.dart';


class AuthRepoImpl implements AuthRepo {
  final ApiService api;
  AuthRepoImpl(this.api);

  

  
  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchdatasignup({required String FullName, required dynamic password, required dynamic ConfirmPassword, required String Email}) async {
    try {

      final data = await api.post(
        endPoint: 'register',             
        body: {
          'FullName': FullName,
          'password': password,
          'ConfirmPassword':ConfirmPassword,
          'Email':Email,
        },
      );


      return right(data); 
    }
     on DioException catch (e) {
      return left(ServerFailure.fromDioError(e)); 
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchdataotp({required String code, required String Email})  async {
    try {

      final data = await api.post(
        endPoint: 'verify-otp',             
        body: {
         'Code':code,
          'Email':Email,
        },
      );


      return right(data); 
    }
     on DioException catch (e) {
      return left(ServerFailure.fromDioError(e)); 
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  
    
      @override
      Future<Either<Failure, Map<String, dynamic>>> fetchdataresendotp({required String Email}) async{
     try {

      final data = await api.post(
        endPoint: 'resend-otp',             
        body: {
       
          'Email':Email,
        },
      );


      return right(data); 
    }
     on DioException catch (e) {
      return left(ServerFailure.fromDioError(e)); 
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
      }






  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchdatalogin({required password, required String Email}) async {
      try {
        final data = await api.post(
          endPoint: 'login',             
          body: {
            'Email': Email,
            'password': password,
          },
        );

    
        final sp = await SharedPreferences.getInstance();
        final token = data['token'] ;
        // await NotificationService().initConnection(token);
        final user = data['user'];


if (token != null) {
  await sp.setString('token', token);

  // تفعيل الاتصال بـ SignalR
  await getIt<NotificationService>().startConnection(token);
}

if (user != null) {
  await sp.setString('role', user['role']);
}

        return right(data); 
      }
       on DioException catch (e) {
        return left(ServerFailure.fromDioError(e)); 
      } catch (e) {
        return left(ServerFailure(e.toString()));
      }
    }

  }
  

