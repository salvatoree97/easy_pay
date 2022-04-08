import 'package:common/app/app_state.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:core/core.dart';

ThunkAction<AppState> reloadUser({
  FirebaseUser? firebaseUser,
  required Function onFinish,
}) =>
    (Store<AppState> store) async {
      Logger.instance.info(
          'Reload user after sendEmailVerification with user: $firebaseUser');
      if (firebaseUser?.emailVerified ?? false) return;
      await firebaseUser?.reload();

      final FirebaseUser? currentUser =
          FirebaseAuthService.instance.currentUser;
      if (currentUser == null) {
        Logger.instance.info('Current user is null');
        store.dispatch(UserFetchFailed());
        return;
      }

      try {
        if (currentUser.emailVerified && currentUser.email != null) {
          Logger.instance.info('Current user: $currentUser');
          store.dispatch(UserRegistrationSucceded(firebaseUser: currentUser));
          onFinish();
        }
      } catch (error) {
        Logger.instance
            .error('Reload user after sendEmailVerification with user: $error');
      }
    };
