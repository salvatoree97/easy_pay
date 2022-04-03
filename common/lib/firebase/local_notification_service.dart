import 'dart:convert';
import 'dart:io';
import 'package:common/firebase/push_notification_service.dart';
import 'package:common/models/notification_model.dart';
import 'package:core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static const channelId = 'high_importance_channel';
  static const channelName =
      'com.google.firebase.messaging.default_notification_channel_id';

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    channelName,
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  static const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    channelId,
    channelName,
    importance: Importance.max,
  );

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static void initilize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
      macOS: null,
    );

    Logger.instance.info('inFlutterLocalNotificationPlugin');

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  ///Use [showNotification] to intercept silent "data" notification and show [localNotification]
  static Future showNotification(RemoteMessage? message) async {
    if (message == null || Platform.isIOS) return;

    final int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _flutterLocalNotificationsPlugin.show(
      id,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload:
          json.encode(NotificationModel.fromRemoteMessage(message).toJson()),
    );
  }

  ///Set [selectNotification] to handle tap gesture on notification
  static Future selectNotification(String? payload) async {
    if (payload == null) return;
    Logger.instance.info(payload);
    PushNotificationService.instance.serializeAndNavigate(
      NotificationModel.fromMap(
        json.decode(payload),
      ),
    );
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
