import 'package:core/logger/logger.dart';

extension Nullable on Map<String, dynamic> {
  dynamic getNullableKey(String key) {
    return this[key];
  }

  ///Use this function to map a [Object] that can be null.
  dynamic getNullableObject(
    String key, {
    required Function(Map<String, dynamic>)? map,
  }) {
    if (this[key] == null) return null;
    final object = map?.call(this[key]);
    return object;
  }

  dynamic getRequiredKey(String key) {
    try {
      if (this[key] == null) throw Exception('Required $key must not be null');
      return this[key];
    } catch (error) {
      Logger.instance.error(error);
      rethrow;
    }
  }

  ///Use this function to map a json key that contains a list:
  ///Set always the [T] that you exept to recive
  ///There are two different cases:
  /// - json[key] is a list of custom object -> Use [map] function to explain how to map the json[key] list values
  ///  (Example: json.getListFromKey<ClubModel>([key], [map]: (item) => ClubModel.fromJson(item)))
  /// - json[key] is a list of standard object (Stirng, int ecc) -> Use only [key] value
  /// (Example: json<String>.getListFromKey([key]))
  List<T> getListFromKey<T>(String key, {Function(Map<String, dynamic>)? map}) {
    try {
      final List list = this[key] ?? [];
      if (map != null) {
        return list.map<T>((element) => map(element)).toList();
      }
      return List<T>.from(list);
    } catch (error) {
      Logger.instance.error(error);
      rethrow;
    }
  }
}
