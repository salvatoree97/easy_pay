import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _biometrySwitchValue;

  BiometricType? _defaultBiometricType;

  String? get biometricDescription {
    if (_defaultBiometricType == null) return null;

    if (_defaultBiometricType == BiometricType.face) {
      return 'Login con FaceID';
    }
    if (_defaultBiometricType == BiometricType.fingerprint) {
      return 'Login con impronta digitale';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _biometrySwitchValue = false;
    _refreshBiometricsValue();
  }

  void _refreshBiometricsValue() {
    BiometricsService.instance.defaultBiometricType
        .then((value) => _setDefaultBioemtricType(value));
    BiometricsService.instance
        .isLoginWithBiometricsActive()
        .then((value) => _setBiometrySwitchValue(value));
  }

  void _setBiometrySwitchValue(bool newValue) {
    setState(() => _biometrySwitchValue = newValue);
  }

  void _setDefaultBioemtricType(BiometricType? type) {
    setState(() => _defaultBiometricType = type);
  }

  void _onBiometrySwitchChanged(bool newValue) {
    _setBiometrySwitchValue(newValue);
    _onBiometricsTapped(newValue);
  }

  void _onBiometricsTapped(bool shouldActivateBiometrics) {
    if (shouldActivateBiometrics) {
      PackageConfiguration.navigationService
          .push(AppRoutes.biometricsPasswordScreen)
          ?.then((isAuthenticated) => _onBiometricsComplete(isAuthenticated));
    } else {
      _handleDeleteLoginWithBiometrics();
    }
  }

  void _handleDeleteLoginWithBiometrics() {
    UserManager.instance
        .setIsLoginWithBiometrics(false)
        .then((value) => setState(() {}));
  }

  void _onBiometricsComplete(bool isAuthenticated) {
    _refreshBiometricsValue();
    //show success or error
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const DefaultAppBar(title: 'Impostazioni'),
      body: Column(
        children: [
          biometricDescription != null
              ? IconTitleDescriptionWidget.withSwitch(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: Dimension.defaultPadding,
                    right: Dimension.defaultPadding,
                  ),
                  title: biometricDescription!,
                  switchValue: _biometrySwitchValue,
                  onSwitchChanged: _onBiometrySwitchChanged,
                  switchSize: 25,
                  imageSize: 40,
                  imagePadding: const EdgeInsets.all(Dimension.defaultPadding),
                  imageColor: Theme.of(context).colorScheme.onSecondary,
                  placeholderImage: _defaultBiometricType == BiometricType.face
                      ? Icons.face
                      : Icons.fingerprint,
                )
              : Container()
        ],
      ),
    );
  }
}
