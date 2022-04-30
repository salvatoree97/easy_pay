import 'package:common/common.dart';

ThunkAction<AppState> biometricsPasswordThunk({
  required String password,
  required Function() onSuccess,
  required Function() onError,
}) =>
    (Store<AppState> store) async {
      final username = store.state.userState.firebaseUser?.email;
      if (username == null) {
        onError.call();
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
          onError.call();
        }
      } catch (error) {
        onError.call();
      }
    };
