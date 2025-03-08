import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get IsInitialized => _isInitialized;

  Future<void> initNotifications() async {
    if (_isInitialized) return; // prevent re-initialization

    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: initSettingsAndroid,
    );

    await notificationPlugin.initialize(settings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
      "daily_channel_id",
      "Daily Notifications",
      channelDescription: "Daily Notification Channel",
      importance: Importance.max,
      priority: Priority.high,
    ));
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(),
    );
  }
}
