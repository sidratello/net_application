import 'package:net_aplecation/local_notification.dart';
import 'package:signalr_core/signalr_core.dart';


class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  late HubConnection _hubConnection;
  bool _started = false;
Future<void> startConnection(String token) async {
  if (_started) return;

  _hubConnection = HubConnectionBuilder()
      .withUrl(
        'http://192.168.1.7:44352/lockoutHub', // جرّبي http بدل https لو عندك مشكلة شهادة
        HttpConnectionOptions(
          accessTokenFactory: () async => token,
        ),
      )
      .withAutomaticReconnect()
      .build();

  _hubConnection.onclose((error) {
    print('❌ SignalR closed: $error');
    _started = false;
  });

  _hubConnection.onreconnecting((error) {
    print('🔄 SignalR reconnecting: $error');
  });

  _hubConnection.onreconnected((connectionId) {
    print('✅ SignalR reconnected: $connectionId');
  });

  _hubConnection.on('AccountLockedOut', (args) async {
    final msg = (args != null && args.isNotEmpty)
        ? args[0].toString()
        : 'Your account has been locked.';

    print('🔔 AccountLocked from SignalR: $msg');

    await LocalNotificationService().showNotification(
      title: 'Account Locked',
      body: msg,
    );
  });

  try {
    await _hubConnection.start();
    _started = true;
    print('✅ SignalR Connected');
  } catch (e) {
    print('❌ Error starting SignalR: $e');
  }
}
}