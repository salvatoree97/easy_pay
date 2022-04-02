import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:core/networking/models/cache_type.dart';

class CacheOptions {
  ///[useCache] indicates if save network data.
  final bool useCache;

  ///Set [cacheType] to set where save network data.
  final CacheType cacheType;

  ///If [useCache] is true default value will be [getOptions(Duration(days: 1))].
  ///Set this [value] by constructor using [CacheOptions.getOptions()]
  Options? value;

  CacheOptions({
    this.useCache = false,
    this.cacheType = CacheType.memory,
    this.value,
  }) {
    if (useCache && value == null) {
      value = getOptions(const Duration(days: 1));
    }
  }

  ///Create [cacheOptions] from parameters: maxAge, primaryKey, subKey, forceRefresh.
  static Options getOptions(
    Duration maxAge, {
    Duration? maxStale,
    String? primaryKey,
    String? subKey,
    bool? forceRefresh,
  }) {
    return buildCacheOptions(
      maxAge,
      maxStale: maxStale,
      primaryKey: primaryKey,
      subKey: subKey,
      forceRefresh: forceRefresh,
    );
  }
}
