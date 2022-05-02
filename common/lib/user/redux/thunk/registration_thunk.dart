import 'dart:io';
import 'package:common/app/app_state.dart';
import 'package:bffe/bffe.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/models/common_error.dart';
import 'package:common/services/error_services.dart';
import 'package:common/user/redux/action/user_actions.dart';
import 'package:common/user/redux/service/set_user_dto.dart';
import 'package:core/core.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> registrationThunk({
  required String username,
  required String password,
  required String name,
  required String lastname,
  String? fiscalCode,
  File? userImage,
  required Function() onSuccess,
  required OnError onError,
}) =>
    (Store<AppState> store) async {
      store.dispatch(UserRegistrationRequested());
      Logger.instance.info(
          'Send createUserWithEmailAndPassword wiht: username: $username, password: $password');
      try {
        await FirebaseAuthService.instance.createUser(
          email: username,
          password: password,
        );
        Logger.instance
            .info('Firebase user: ${FirebaseAuthService.instance.currentUser}');

        if (FirebaseAuthService.instance.currentUser == null) {
          final dto = SetUserDTO(
            email: username,
            lastname: lastname,
            name: name,
          );

          final user = await BffeDataService.setUser(dto);

          Logger.instance.debug(user);

          store.dispatch(UserRegistrationSucceded(
            firebaseUser: FirebaseAuthService.instance.currentUser!,
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
          onError.call(CommonError.deafaultError);
          store.dispatch(UserRegistrationFailed());
        }
      } on Exception catch (error) {
        Logger.instance.error(
            'Error for createUserWithEmailAndPassword wiht: error: $error');
        onError.call(error);
        store.dispatch(UserRegistrationFailed());
      }
    };
