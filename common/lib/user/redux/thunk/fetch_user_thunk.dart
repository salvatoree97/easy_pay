import 'package:common/app/app_state.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/user/models/user_model.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:common/user/redux/api/user_api.dart';
import 'package:core/core.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchUserThunk({
  required Function() onError,
  required Function() onEmailNotConfirmed,
  required Function() onSuccess,
}) {
  return (Store<AppState> store) async {
    void onErrorHandler() {
      store.dispatch(UserFetchFailed());
      onError.call();
    }

    void onEmailNotConfirmedHandler() {
      onEmailNotConfirmed.call();
    }

    void onSuccessHandler(FirebaseUser firebaseUser, UserModel userModel) {
      store.dispatch(
          UserFetchSucceded(firebaseUser: firebaseUser, user: userModel));
      onSuccess.call();
    }

    store.dispatch(UserFetchRequested());

    FirebaseUser? user = FirebaseAuthService.instance.currentUser;
    Logger.instance.info('Current Firebase user: $user');

    if (user == null) {
      Logger.instance.info('The user is: $user, so _goToInitialScreen');
      onErrorHandler();
      return;
    }

    try {
      await user.getIdTokenResult(true);
    } catch (e) {
      Logger.instance.info('Token is invalid');
      onErrorHandler();
      return;
    }

    if (!user.emailVerified) {
      Logger.instance.info('The user has not email verified, so goTo _Confirm');
      store.dispatch(UserFetchSucceded(firebaseUser: user, user: null));
      onEmailNotConfirmedHandler();
      return;
    }

    try {
      Logger.instance.info('Send UserApi.getUser for user: $user');
      final userModel = await UserApi.getUser(email: user.email!);
      onSuccessHandler(user, userModel);
    } catch (error) {
      Logger.instance.error('Send UserApi.getUser failed with error: $error');
      onErrorHandler();
    }
  };
}
