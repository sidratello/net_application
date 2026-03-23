import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/data/repos/auth_repo_imp.dart';
import 'package:flutter_application_1/Auth/presentation/manager/logincubit/login_cubit.dart';
import 'package:flutter_application_1/Auth/presentation/manager/otpcubit/otp_cubit.dart';
import 'package:flutter_application_1/Auth/presentation/manager/resendotpcubit/resendotp_cubit.dart';
import 'package:flutter_application_1/Auth/presentation/manager/signupcubit/signup_cubit.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/local_notification.dart';
import 'package:flutter_application_1/core/utils/singlr_servese.dart';
import 'package:flutter_application_1/core/utils/units/server_locater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/app_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          // ارجع true لتجاهل خطأ الشهادة
          return true;
        };
    return client;
  }
}

String token = '';

void main() async {
  if (kDebugMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await getIt<LocalNotificationService>().init();
  final sp = await SharedPreferences.getInstance();
  final savedToken = sp.getString('token');
  token = savedToken.toString();

  if (savedToken != null && savedToken.isNotEmpty) {
    print("😊$savedToken");
    await getIt<NotificationService>().startConnection(savedToken.toString());
    // await getIt<NotificationService>().startConnectionComplaintHub(
    //   savedToken.toString(),
    // );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ComplaintCubit>()),
        BlocProvider(
          create: (context) => SignupCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(create: (context) => OtpCubit(getIt.get<AuthRepoImpl>())),

        BlocProvider(
          create: (context) => ResendotpCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        locale: const Locale('ar'),

        supportedLocales: const [Locale('ar'), Locale('en')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    );
  }
}
