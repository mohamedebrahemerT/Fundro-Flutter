// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fundro_app/core/utils/imports.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('💤 Handling a background message: ${message.messageId}');
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
// }

// class NotificationHelper {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initNotifications() async {
//     await _messaging.requestPermission();

//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'Channel for important notifications',
//       importance: Importance.max,
//       playSound: true,
//     );

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await _localNotifications.initialize(initializationSettings);

//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);

//     FirebaseMessaging.onMessage.listen(_showForegroundNotification);

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('🔔 Notification clicked: ${message.notification?.title}');
//     });
//     String? token = await FirebaseMessaging.instance.getToken();
//     debugPrint('🔑 Firebase Token: $token');
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }

//   static Future<void> _showForegroundNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null && android != null) {
//       await _localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel',
//             'High Importance Notifications',
//             channelDescription: 'Channel for important notifications',
//             importance: Importance.max,
//             priority: Priority.high,
//             playSound: true,
//           ),
//         ),
//       );
//     }
//   }
// }
