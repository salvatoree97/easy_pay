import 'dart:io';
import 'package:common/app/app_state.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> registrationThunk({
  required String username,
  required String password,
  File? userImage,
  required Function() onSuccess,
}) =>
    (Store<AppState> store) async {
      store.dispatch(UserRegistrationRequested());
      Logger.instance.info(
          'Send createUserWithEmailAndPassword wiht: username: $username, password: $password');
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );
        Logger.instance
            .info('Firebase user: ${FirebaseAuth.instance.currentUser}');

        if (FirebaseAuth.instance.currentUser != null) {
          store.dispatch(UserRegistrationSucceded(
            firebaseUser: FirebaseAuth.instance.currentUser!,
          ));

          //UserManager.instance.saveUsername(username);
          //UserManager.instance.saveImage(userImage);

          // final bool canAskBiometrics =
          //     await BiometricsService.instance.canAskBiometrics;

          // if (canAskBiometrics) {
          //   final bool? canConfigureFaceId =
          //       await NavigationService.instance.showFloatingBottomSheet<bool>(
          //     onDismiss: () => NavigationService.instance.goBack(value: false),
          //     childWidget: BiometricsFloatingWidget(
          //       onConfirmPressed: () =>
          //           NavigationService.instance.goBack(value: true),
          //       onDeclinePressed: () =>
          //           NavigationService.instance.goBack(value: false),
          //     ),
          //   );

          //   if (canConfigureFaceId ?? false) {
          //     await BiometricsService.instance
          //         .savePasswordUsingBiometrics(password);
          //   }
          // }

          onSuccess();
        } else {
          Logger.instance.error(
              'Error for createUserWithEmailAndPassword because FirebaseAuth.instance.currentUser is null');
          store.dispatch(UserRegistrationFailed());
        }
      } on Exception catch (error) {
        Logger.instance.error(
            'Error for createUserWithEmailAndPassword wiht: error: $error');
        //ErrorService.instance.showError(error: error);
        store.dispatch(UserRegistrationFailed());
      }
    };
