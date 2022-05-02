import 'package:common/app/app_state.dart';
import 'package:common/app/package_configuration.dart';
import 'package:common/app/routes.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/services/biometrics_service.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:common/user/redux/api/user_api.dart';
import 'package:common/user/user_manager.dart';
import 'package:core/core.dart';
import 'package:design/widgets/base/option_bottom_sheet_screen.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginThunk({
  required String username,
  required String password,
  required Function onSuccess,
  required Function onEmailNotConfirmed,
  required Function onError,
}) =>
    (Store<AppState> store) async {
      store.dispatch(UserLoginRequested());
      try {
        await FirebaseAuthService.instance.loginWith(
          email: username,
          password: password,
        );

        Logger.instance.info(
          'Send signInWithEmailAndPassword with email: $username, password: $password',
        );

        FirebaseUser? currentUser = FirebaseAuthService.instance.currentUser;

        if (currentUser == null) {
          return;
        }

        try {
          await currentUser.getIdTokenResult(true);
          Logger.instance.info('Firebase user: $currentUser');

          UserManager.instance.saveUsername(username);

          final bool canAskBiometrics = await BiometricsService
              .instance.canAskBiometrics
              .catchError((_) => false);
          final bool isLoginWithBiometricsActive = await BiometricsService
              .instance
              .isLoginWithBiometricsActive()
              .catchError((_) => false);

          final bool hasChangedPassword = await BiometricsService.instance
              .hasToSaveDifferentPassword(password)
              .catchError((_) => false);

          if (canAskBiometrics &&
              (!isLoginWithBiometricsActive || hasChangedPassword)) {
            await _handleBiometricsFlow(password)
                .catchError((error) => Logger.instance.error(error));
          }

          if (currentUser.emailVerified) {
            final userModel = await UserApi.getUser(email: currentUser.email!);

            store.dispatch(
              UserFetchSucceded(
                firebaseUser: currentUser,
                user: userModel,
              ),
            );

            onSuccess.call();

            return;
          }

          onEmailNotConfirmed.call();
          store.dispatch(UserLoginSuccesful(currentUser));
        } catch (error) {
          store.dispatch(UserFetchFailed());
        }
      } catch (error) {
        store.dispatch(UserFetchFailed());
      }
    };

Future _handleBiometricsFlow(String password) async {
  final bool? canConfigureFaceId =
      await PackageConfiguration.navigationService.push(
    AppRoutes.optionSheet,
    arguments: OptionBottomSheetParams(
      title: S.current.set_biometry_title,
      description: S.current.set_biometry_description,
    ),
  );

  if (canConfigureFaceId ?? false) {
    await BiometricsService.instance.savePasswordUsingBiometrics(password);
  }
}
