

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:net_aplecation/core/units/app_Router.dart';
import 'package:net_aplecation/core/units/server_locater.dart';
import 'package:net_aplecation/feature/Auth/data/repos/auth_repo_imp.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/logincubit/login_cubit.dart';
import 'package:net_aplecation/feature/Auth/presentation/manager/otpcubit/otp_cubit.dart';

import 'package:net_aplecation/feature/Auth/presentation/manager/signupcubit/signup_cubit.dart';
import 'package:net_aplecation/local_notification.dart';
import 'package:net_aplecation/singlr_servese.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 

  setupServiceLocator();
  await getIt<LocalNotificationService>().init();
    final sp = await  SharedPreferences.getInstance();
  final savedToken = sp.getString('token');
  if (savedToken != null && savedToken.isNotEmpty) {
    // 3) نبدأ اتصال SignalR باستخدام آخر توكن موجود
    await getIt<NotificationService>().startConnection(savedToken);
  }


  runApp(const net_aplecation());
}

class net_aplecation extends StatelessWidget {
  const net_aplecation({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        
        BlocProvider(
          create: (context) => SignupCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => OtpCubit(
            getIt.get<AuthRepoImpl>(),
          ),
        ),
            BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepoImpl>(),
      ),),
      ],
    
      child:
      MaterialApp.router(
    debugShowCheckedModeBanner: false,
     routerConfig: AppRouter.router,
      
      ),
    );
  }



}


