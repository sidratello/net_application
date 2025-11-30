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
  if (args == null || args.isEmpty) return;

  // تحويل الرسالة القادمة من SignalR إلى Map
  final data = args[0];

  // استخراج النص من "message"
  final message = data is Map && data.containsKey('message')
      ? data['message'].toString()
      : args[0].toString();

  print('🔔 AccountLocked from SignalR: $message');

  await LocalNotificationService().showNotification(
    title: 'Account Locked',
    body: message, // فقط الرسالة
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