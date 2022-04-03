import 'package:design/design.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseService {
  FirebaseService._();

  static final instance = FirebaseService._();

  Future initialize() async {
    try {
      final firebaseApp = await Firebase.initializeApp();
      Logger.instance.info('Firebase app: ${firebaseApp.options}');
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } catch (error) {
      Logger.instance.error('Error during firebase app initialization: $error');
    }
  }

  ///Used to simulate a crash in application.
  void simulateCrash() {
    FirebaseCrashlytics.instance.crash();
  }

  /*///Used to send [screenName] to Analytics.
  Future<void> testSetCurrentScreen({@required String screenName}) async {
    await (analytics as FirebaseAnalytics).logEvent(
      name: 'ScreenName',
      parameters: {'screen_name': screenName},
    );
    Logger.instance
        .info('Analytics: setCurrentScreen succeeded -> $screenName');
  }

  ///Used to get [FirebaseObserver] for navigation
  NavigatorObserver getNavigatorObserver() {
    return FirebaseAnalyticsObserver(analytics: analytics);
  }*/
}
