import 'package:core/core.dart';

class PersistenceManager {
  PersistenceManager._();

  static final PersistenceManager instance = PersistenceManager._();

  Future<T?> readValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    T? value;
    if (T == bool) {
      value = prefs.getBool(key) as T;
      Logger.instance.debug('Save key: $key, $value, type bool');
    }

    if (T == double) {
      value = prefs.getDouble(key) as T;
      Logger.instance.debug('Save key: $key, $value, type double');
    }

    if (T == String) {
      value = prefs.getString(key) as T;
      Logger.instance.debug('Save key: $key, $value, type String');
    }

    if (T == int) {
      value = prefs.getInt(key) as T;
      Logger.instance.debug('Save key: $key, $value, type int');
    }

    return value;
  }

  Future<T?> setValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    bool success = false;
    if (value is bool) {
      Logger.instance.debug('Save key: $key, $value, type bool');
      success = await prefs.setBool(key, value);
    }

    if (value is double) {
      Logger.instance.debug('Save key: $key, $value, type double');
      success = await prefs.setDouble(key, value);
    }

    if (value is String) {
      Logger.instance.debug('Save key: $key, $value, type String');
      success = await prefs.setString(key, value);
    }

    if (value is int) {
      Logger.instance.debug('Save key: $key, $value, type int');
      success = await prefs.setInt(key, value);
    }
    if (!success) {
      Logger.instance.debug('NotSave key: $key, $value, type ${T.toString()}');
    }
    return success ? value : null;
  }
}
