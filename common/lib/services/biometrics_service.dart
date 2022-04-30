import 'package:common/user/user_manager.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsService {
  final LocalAuthentication localAuthentication;

  BiometricsService._({
    required this.localAuthentication,
  });

  static final instance = BiometricsService._(
    localAuthentication: LocalAuthentication(),
  );

  Future<bool> get canAskBiometrics async =>
      await _isBiometricsSupported && await _canCheckBiometrics;

  Future<BiometricType?> get defaultBiometricType async {
    final biometricTypes = await _biometricTypes;

    if (biometricTypes.contains(BiometricType.face)) {
      return BiometricType.face;
    }

    if (biometricTypes.contains(BiometricType.fingerprint)) {
      return BiometricType.fingerprint;
    }

    return null;
  }

  Future<bool> isLoginWithBiometricsActive() async {
    return UserManager.instance.isLoginWithBiometricsActive();
  }

  Future<bool> hasToSaveDifferentPassword(String password) async {
    final String? oldPassword = await UserManager.instance.fetchPassword();
    return password != oldPassword;
  }

  Future<String?> handleLoginWithBiometrics() async {
    final isUserBeenAuthenticated =
        await BiometricsService.instance._authenticateWithBiometrics();

    if (isUserBeenAuthenticated) {
      final password = await UserManager.instance.fetchPassword();
      return password;
    }

    return null;
  }

  Future<bool> savePasswordUsingBiometrics(String password) async {
    final isUserBeenAuthenticated =
        await BiometricsService.instance._authenticateWithBiometrics();

    if (isUserBeenAuthenticated) {
      await UserManager.instance.savePassword(password);
      await UserManager.instance.setIsLoginWithBiometrics(true);
    }
    return isUserBeenAuthenticated;
  }

  Future<bool> _authenticateWithBiometrics() async {
    bool canContinueWithBiometrics = await canAskBiometrics;

    bool isAuthenticated = false;

    if (canContinueWithBiometrics) {
      isAuthenticated =
          await BiometricsService.instance._handleBiometryRequest();
    }

    return isAuthenticated;
  }

  Future<bool> _handleBiometryRequest() async =>
      localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        options: const AuthenticationOptions(biometricOnly: true),
      );

  Future<bool> get _isBiometricsSupported async =>
      await localAuthentication.isDeviceSupported();

  Future<bool> get _canCheckBiometrics async {
    final canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    if (!canCheckBiometrics) return false;
    final list = await _biometricTypes;

    return list.contains(BiometricType.face) ||
        list.contains(BiometricType.fingerprint);
  }

  Future<List<BiometricType>> get _biometricTypes async =>
      await localAuthentication.getAvailableBiometrics();
}
