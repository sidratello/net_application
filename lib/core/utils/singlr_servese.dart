import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/local_notification.dart';
import 'package:flutter_application_1/core/utils/units/server_locater.dart';
import 'package:signalr_core/signalr_core.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  late HubConnection _hubConnection;
  late HubConnection _hubConnectionCompllent;
  bool _started = false;
  Future<void> startConnection(String token) async {
    if (_started) return;

    _hubConnection = HubConnectionBuilder()
        .withUrl(
          //'http://192.168.137.173:44352/lockoutHub',
          'https://192.168.137.173:10349/lockoutHub',
          HttpConnectionOptions(accessTokenFactory: () async => token),
        )
        .withAutomaticReconnect()
        .build();
    startConnectionComplaintHub(token);
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

      final data = args[0];

      final message = data is Map && data.containsKey('message')
          ? data['message'].toString()
          : args[0].toString();

      print('🔔 AccountLocked from SignalR: $message');

      await LocalNotificationService().showNotification(
        title: 'Account Locked',
        body: message,
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

  Future<void> startConnectionComplaintHub(String token) async {
    _hubConnectionCompllent = HubConnectionBuilder()
        .withUrl(
          // 'http://192.168.1.7:44352/lockoutHub',
          'https://192.168.137.173:10349/complainthub',

          HttpConnectionOptions(accessTokenFactory: () async => token),
        )
        .withAutomaticReconnect()
        .build();

    _hubConnectionCompllent.onclose((error) {
      print('❌ SignalR closed: $error');
      _started = false;
    });

    _hubConnectionCompllent.onreconnecting((error) {
      print('🔄 SignalR reconnecting: $error');
    });

    _hubConnectionCompllent.onreconnected((connectionId) {
      print('✅ SignalR reconnected: $connectionId');
    });

    _hubConnectionCompllent.on('ComplaintNoteAdded', (args) async {
      if (args == null || args.isEmpty) return;

      final data = args[0];

      final message = data is Map && data.containsKey('message')
          ? data['message'].toString()
          : args[0].toString();

      print('🔔 ComplaintNoteAdded from SignalR: $message');

      await LocalNotificationService().showNotification(
        title: 'Complaint Note Added',
        body: message,
      );
    });
    _hubConnectionCompllent.on('ComplaintStatusChanged', (args) async {
      if (args == null || args.isEmpty) return;
      await getIt<ComplaintCubit>().getComplaints();
      final data = args[0];

      final message = data is Map && data.containsKey('message')
          ? data['message'].toString()
          : args[0].toString();

      print('🔔 ComplaintStatusChanged from SignalR: $message');

      await LocalNotificationService().showNotification(
        title: 'Complaint status changed',
        body: message,
      );
    });

    try {
      await _hubConnectionCompllent.start();
      _started = true;
      print('✅ SignalR Connected');
    } catch (e) {
      print('❌ Error starting SignalR: $e');
    }
  }
}
