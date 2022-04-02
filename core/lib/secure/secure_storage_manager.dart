import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:core/secure/persistence_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageManager {
  static final SecureStorageManager instance = SecureStorageManager._();

  SecureStorageManager._();

  // Create storage
  final _storage = const FlutterSecureStorage();

  Future<void> checkApplicationConsistency() async {
    final prefs = await SharedPreferences.getInstance();
    final firstRun = prefs.getBool(PersistenceKeys.keyFirstRun) ?? true;
    if (firstRun) {
      deleteAllValues();
      prefs.setBool(PersistenceKeys.keyFirstRun, false);
    }
  }

  /// Check if secure storage contains a key
  Future<bool> containsKey(String key) async {
    bool presence = await _storage.containsKey(key: key);
    return presence;
  }

  /// Read a value from secure storage
  Future<String?> readValue(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  /// Read all values from secure storage
  Future<Map<String, String>> readAllValues() async {
    Map<String, String> allValues = await _storage.readAll();
    return allValues;
  }

  /// Delete value from secure storage
  Future<void> deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all values from secure storage
  Future<void> deleteAllValues() async {
    await _storage.deleteAll();
  }

  /// Write value in secure storage
  Future<void> writeValue(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }
}
