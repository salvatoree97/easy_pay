import 'dart:io';
import 'package:common/firebase/firebase_service.dart';
import 'package:common/firebase/local_notification_service.dart';
import 'package:common/models/notification_model.dart';
import 'package:common/services/route_resolver_service_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:core/core.dart';

class PushNotificationService {
  PushNotificationService._();
  static final instance = PushNotificationService._();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  String? fcmToken;
  RouteResolverServiceInterface? routeResolver;
  bool _listnersAreAlreadyInitialized = false;

  Future<String?> initialize({
    RouteResolverServiceInterface? resolver,
  }) async {
    routeResolver = resolver;
    try {
      fcmToken = await _fcm.getToken();
      Logger.instance.info(fcmToken);
    } catch (error) {
      Logger.instance.error(error);
      return null;
    }

    final canContinue = await _isNotificationsAuthorized();

    if (canContinue && Platform.isAndroid) LocalNotificationService.initilize();

    if (Platform.isIOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    _initialiseMessagingListners();
    return fcmToken;
  }

  ///Call this function to ask notification alert permission
  Future<bool> askNotificationPermissionIfNeeded() async {
    Logger.instance.debug('askNotificationPermissionIfNeeded');
    if (Platform.isAndroid) return true;
    NotificationSettings settings = await _fcm.requestPermission();

    Logger.instance.debug(settings.authorizationStatus);

    final canInitialiseListners =
        settings.authorizationStatus == AuthorizationStatus.authorized;

    fcmToken = await _fcm.getToken();

    if (canInitialiseListners && !_listnersAreAlreadyInitialized) {
      _initialiseMessagingListners();
    }
    return canInitialiseListners;
  }

  ///Initilise of notification listners
  void _initialiseMessagingListners() {
    _fcm.getInitialMessage().then((message) => _onInitialMessage(message));
    FirebaseMessaging.onMessage
        .listen((message) => _onForegroundNotification(message));
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _onNotificationTapped(message));
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    _listnersAreAlreadyInitialized = true;
  }

  ///Return true if [notificationSetting.authorizationStatus] is [AuthorizationStatus.authorized]
  Future<bool> _isNotificationsAuthorized() async {
    if (Platform.isAndroid) return true;
    final notificationSetting = await _fcm.getNotificationSettings();
    return notificationSetting.authorizationStatus ==
        AuthorizationStatus.authorized;
  }

  ///Callback used when [notification] arrived in app state [foreground]
  ///This function will be show [localNotification]
  void _onForegroundNotification(RemoteMessage? message) {
    if (message?.notification == null) return;
    Logger.instance.info('On Foreground Notificatioin: $message');
    LocalNotificationService.showNotification(message);
  }

  void _onInitialMessage(RemoteMessage? message) {
    if (message == null) return;
    Logger.instance.info('On Initial Message: ${message.notification}');
    serializeAndNavigate(NotificationModel.fromRemoteMessage(message));
  }

  ///Callback user when notification is clicked
  void _onNotificationTapped(RemoteMessage? message) {
    if (message == null) return;
    Logger.instance.info('On Notification tapped: ${message.notification}');
    serializeAndNavigate(NotificationModel.fromRemoteMessage(message));
  }

  ///
  void serializeAndNavigate(NotificationModel? notificationModel) {
    Logger.instance
        .info('On SerializeAndNavigate handler: ${notificationModel!.title}');
    routeResolver?.resolveRoute(notificationModel);
  }
}

///Callback used when [notification] arrived in app state [background]
///This function will be show [localNotification]
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  Logger.instance.info(
      'On Background Notification handler: ${message!.notification!.title}');
  await FirebaseService.instance.initialize();
}
