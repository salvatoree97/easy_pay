import 'package:bffe/bffe.dart';
import 'package:common/app/app_state.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:common/user/redux/service/get_user_dto.dart';
import 'package:core/core.dart';
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
      // final bool canAskBiometrics =
      //     await BiometricsService.instance.canAskBiometrics;
      // final bool isLoginWithBiometricsActive =
      //     await BiometricsService.instance.isLoginWithBiometricsActive();

      // if (canAskBiometrics && !isLoginWithBiometricsActive) {
      //   await _handleBiometricsFlow(password);
      // }
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

          //UserManager.instance.saveUsername(username);

          // final bool hasChangedPassword = await BiometricsService.instance
          //     .hasToSaveDifferentPassword(password);
          // if (hasChangedPassword) await _handleBiometricsFlow(password);

          if (currentUser.emailVerified) {
            final dto = GetUserDTO(email: currentUser.email ?? '');
            final userModel = await BffeDataService.getUser(dto);

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

// Future _handleBiometricsFlow(String password) async {
//   final bool? canConfigureFaceId =
//       await NavigationService.instance.showFloatingBottomSheet<bool>(
//     onDismiss: () => NavigationService.instance.goBack(value: false),
//     childWidget: BiometricsFloatingWidget(
//       onConfirmPressed: () => NavigationService.instance.goBack(value: true),
//       onDeclinePressed: () => NavigationService.instance.goBack(value: false),
//     ),
//   );

//   if (canConfigureFaceId ?? false) {
//     await BiometricsService.instance.savePasswordUsingBiometrics(password);
//   }
// }
