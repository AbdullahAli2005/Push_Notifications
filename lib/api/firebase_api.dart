import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseApi {
//   // create an instance of firebase messaging
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   // functions to initialize notifications
//   Future<void> initNotifacations() async {
//     // request permissions
//     await _firebaseMessaging.requestPermission();

//     // fetch FCM Token for this device
//     final fCMToken = await _firebaseMessaging.getToken();

//     print("TOKEN : $fCMToken");
//   }

//   // function to handle received messages

//   // function to initialize background settings
// }


// class FirebaseApi {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
    
//     // Get FCM Token
//     final fCMToken = await _firebaseMessaging.getToken();
//     print("FCM TOKEN: $fCMToken");

//     // Handle incoming messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Foreground Message: ${message.notification?.title}");
//     });

//     // Handle background messages
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("Message clicked! ${message.notification?.title}");
//     });
//   }

//   // Background messages handler
//   static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print("Background Message: ${message.notification?.title}");
//   }
// }

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Initialize Notifications
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    // Get FCM Token
    final fCMToken = await _firebaseMessaging.getToken();
    print("FCM TOKEN: $fCMToken");

    // Initialize local notifications
    await _initLocalNotifications();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Message: ${message.notification?.title}");

      if (message.notification != null) {
        _showNotification(message);
      }
    });

    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message Clicked! ${message.notification?.title}");
    });
  }

  // Initialize local notifications
  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotifications.initialize(settings);
  }

  // Show local notification
  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      0, // Notification ID
      message.notification?.title, // Title
      message.notification?.body, // Body
      platformDetails,
    );
  }

  // Background message handler
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Background Message: ${message.notification?.title}");
  }
}
