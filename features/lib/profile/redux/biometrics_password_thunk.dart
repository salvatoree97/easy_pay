import 'package:common/common.dart';

ThunkAction<AppState> biometricsPasswordThunk({
  required String password,
  required Function() onSuccess,
  required OnError onError,
}) =>
    (Store<AppState> store) async {
      final username = store.state.userState.firebaseUser?.email;
      if (username == null) {
        onError.call(CommonError.deafaultError);
        return;
      }
      try {
        await FirebaseAuthService.instance.loginWith(
          email: username,
          password: password,
        );

        final isAuhtenticated = await BiometricsService.instance
            .savePasswordUsingBiometrics(password);
        if (isAuhtenticated) {
          onSuccess.call();
        } else {
          onError.call(null);
        }
      } catch (error) {
        onError.call(error);
      }
    };
