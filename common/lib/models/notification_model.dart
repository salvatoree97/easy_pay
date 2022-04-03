import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:core/core.dart';

class NotificationModel {
  final String? title;
  final String? body;
  final Map<String, dynamic>? data;

  NotificationModel({
    this.title,
    this.body,
    this.data,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> json) =>
      NotificationModel(
        title: json.getNullableKey('title'),
        body: json.getNullableKey('body'),
        data: json.getNullableKey('data'),
      );

  factory NotificationModel.fromRemoteMessage(RemoteMessage message) =>
      NotificationModel(
        title: message.notification?.title,
        body: message.notification?.body,
        data: message.data,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'data': data,
      };
}
