import 'package:dio/dio.dart';
import 'package:flutter_application_1/Auth/data/repos/auth_repo_imp.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/api_serveses.dart';
import 'package:flutter_application_1/core/utils/local_notification.dart';
import 'package:flutter_application_1/core/utils/singlr_servese.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  // 👇 إشعارات محلية
  getIt.registerSingleton<LocalNotificationService>(LocalNotificationService());
  // 👇 SignalR Notification Service
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt.registerSingleton<ComplaintCubit>(ComplaintCubit());
}
