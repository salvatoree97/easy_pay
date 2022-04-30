import 'dart:io';
import 'package:common/services/image_service.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class UserManager with ChangeNotifier {
  UserManager._();

  static final UserManager instance = UserManager._();

  String? userImageUrl;

  SecureStorageManager secureStorageManager = SecureStorageManager.instance;

  Future<bool> isLoginWithBiometricsActive() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(PersistenceKeys.isBiometricActive) ?? false;
    } catch (error) {
      return false;
    }
  }

  Future<bool> setIsLoginWithBiometrics(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(PersistenceKeys.isBiometricActive, value);
      return value;
    } catch (error) {
      return false;
    }
  }

  Future savePassword(String password) async {
    Logger.instance.info('Save in secure store: $password');
    await secureStorageManager.writeValue(
      SecureStorageKeys.keyUserPassword,
      password,
    );
  }

  Future<String?> fetchPassword() async {
    final password =
        await secureStorageManager.readValue(SecureStorageKeys.keyUserPassword);
    Logger.instance.info('Fetch user password: $password');
    return password;
  }

  Future saveUsername(String username) async {
    Logger.instance.info('Save in secure store: $username');
    await secureStorageManager.writeValue(
      SecureStorageKeys.keyUserEmail,
      username,
    );
  }

  Future<String?> fetchUsername() async {
    final password =
        await secureStorageManager.readValue(SecureStorageKeys.keyUserEmail);
    Logger.instance.info('Fetch user password: $password');
    return password;
  }

  Future saveImage(File? base64Image) async {
    Logger.instance.info('Save in secure store: ${base64Image.toString()}');
    if (base64Image != null) {
      String? userImage =
          await ImageService.instance.convertImageToString(base64Image);
      await Future.wait([
        secureStorageManager.writeValue(
          SecureStorageKeys.keyProfileImage,
          userImage,
        ),
      ]);
    }
  }

  void setImageUrl(String? imageUrl) {
    userImageUrl = imageUrl;
    notifyListeners();
  }

  Future<String?> fetchImage() async {
    String? base64Image =
        await secureStorageManager.readValue(SecureStorageKeys.keyProfileImage);

    Logger.instance.info('From secure storage: ${base64Image.toString()}');
    return base64Image;
  }

  Future<void> clearImage() async {
    await secureStorageManager.deleteValue(SecureStorageKeys.keyProfileImage);
    Logger.instance.info('Deleted ${SecureStorageKeys.keyProfileImage}');
  }
}
