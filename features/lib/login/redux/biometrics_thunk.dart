import 'package:common/common.dart';

ThunkAction<AppState> biometricsThunk({
  String? username,
  required Function(String) onReceivePasswordFromBiometrics,
}) =>
    (Store<AppState> store) async {
      Logger.instance.debug('In biometricsThunk with $username');
      if (username == null || username.isEmpty) return;
      final isLoginWithBiometricsActive =
          await BiometricsService.instance.isLoginWithBiometricsActive();

      Logger.instance.debug(
          'In biometricsThunk isLoginWithBiometricsActive $isLoginWithBiometricsActive');

      if (!isLoginWithBiometricsActive) return;

      final password =
          await BiometricsService.instance.handleLoginWithBiometrics();

      Logger.instance.debug('In biometricsThunk password $password');

      if (password == null) return;
      onReceivePasswordFromBiometrics(password);
    };
