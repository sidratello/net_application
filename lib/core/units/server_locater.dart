
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:net_aplecation/core/api_serveses.dart';
import 'package:net_aplecation/feature/Auth/data/repos/auth_repo_imp.dart';
import 'package:net_aplecation/local_notification.dart';
import 'package:net_aplecation/singlr_servese.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt.get<ApiService>(),
  ));
    // 👇 إشعارات محلية
  getIt.registerSingleton<LocalNotificationService>(
    LocalNotificationService(),
  );
    // 👇 SignalR Notification Service
  getIt.registerSingleton<NotificationService>(
    NotificationService(),
  );

}