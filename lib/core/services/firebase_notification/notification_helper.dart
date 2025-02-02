import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../di/di.dart';
import 'firebase_server_token.dart';

class NotificationHelper {
  factory NotificationHelper() => _instance;
  static final NotificationHelper _instance =
      NotificationHelper._internal();
  static final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  NotificationHelper._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _requestPermissions();

    await _setupLocalNotifications();

    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Received a foreground message!');
      debugPrint('Message Data: ${message.data}');

      if (message.notification != null) {
        debugPrint(
            'Notification Title: ${message.notification?.title}, Body: ${message.notification?.body}');

        _showNotification(
          title: message.notification!.title ?? '',
          body: message.notification!.body ?? '',
        );
      }
    });

    await getDeviceToken();
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // final notificationArgs = NotificationArgs(
    //   title: message.notification?.title ?? '',
    //   body: message.notification?.body ?? '',
    // );

    // navigatorKey.currentState?.context.pushNamed(
    //   AppRoutes.notificationView,
    //   arguments: notificationArgs,
    // );
    debugPrint("Handling background message: ${message.notification}");
  }

  Future<NotificationSettings> _requestPermissions() async {
    return await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //* Subscribe Notification
  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    debugPrint('🔔🔔 Subscribed to $topic🔔🔔');
  }

  //* Unsubscribe Notification
  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    debugPrint('🔕🔕 Unsubscribed from $topic 🔕🔕 ');
  }
  Future<void> sendTopicNotification(
      {String? topic,
        String? token,
        String? orderId,
        String?userId,
        required String title,
        required String body}) async {
    FirebaseServerToken firebaseServerToken = FirebaseServerToken();

    final String serverToken = await firebaseServerToken.getAccessToken();
    try {
      final response = await Dio().post<dynamic>(
        dotenv.get('NOTIFICATION_BASE_URL'),
        options: Options(
          headers: {
            'Authorization': 'Bearer $serverToken',
            'Content-Type': 'application/json',
          },
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: {
          "message": {
            "topic": topic,
            "token": token,
            "notification": {
              "title": title,
              "body": body,

            },
             'data': {'orderId': orderId, 'userId': userId},
          },
        },
      );

      // debugPrint('Authorization : Bearer $serverToken');
      // debugPrint(
      //     'notificationBaseUrl ${dotenv.get('NOTIFICATION_BASE_URL')}');
      debugPrint('Notification sent successfully : ${response.data}');
      //
      // debugPrint(
      //     'Error sending notification: ${response.statusCode} - ${response.data.error.message}');
    } catch (e) {
      debugPrint(' notification error : ${e.toString()} - ');
    }
  }

  // Get the device token
  Future<String?> getDeviceToken() async {
    final deviceToken = await messaging.getToken();
    debugPrint('FCM Token: $deviceToken');
    return deviceToken;
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          // final payload = response.payload!.split('|');
          // // navigatorKey.currentState?.pushNamed(
          // //   AppRoutes.notificationView,
          // //   arguments: NotificationArgs(
          // //     title: payload[0],
          // //     // Use the first part of the payload as the title
          // //     body:
          // //         payload[1], // Use the second part of the payload as the body
          // //   ),
          // // );
        }
      },
    );
  }

  Future<void> _showNotification(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'flowery_id',
      'flowery',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: '$title|$body',
    );
  }
}
