import 'package:core/logger/logger.dart';
import 'package:core/networking/manager/cache_manager.dart';
import 'package:core/networking/models/cache_type.dart';
import 'package:core/networking/models/host.dart';
import 'package:core/networking/models/http_method.dart';
import 'package:core/networking/service/service.dart';

///[CacheManagerHelper] is used to control all cacheManagers.
///It is important to use this class to avoid creating different [cacheManager] instances related to the same [service].
class CacheManagerHelper {
  ///All current [cacheManagers].
  static Set<CacheManager>? _managers = {};

  ///Get [cacheManager] releated to a service. The [cacheMnager] returned by the function is identified by the [host], the [httpMethod] and the [cacheType].
  static CacheManager? getCacheManagerFromService(Service service) {
    return _findOrCreateManager(service: service);
  }

  ///Delete cache and remove all [cacheManager].
  static deleteAllCache() {
    if (_managers?.isNotEmpty == true) {
      _managers?.forEach((element) => element.clearAll());
      Logger.instance.info('Deleted all cache');
      _managers = {}; //da capire se usarlo
    }
  }

  ///Delete cache for a certain [service]. This function will consider [service.host], [service.path] and also [service.queryParameters].
  static deleteCacheForService({required Service service}) {
    deleteCacheForUri(
      host: service.host,
      path: service.path,
      cacheType: service.cacheOptions.cacheType,
      queryParameters: service.queryParameters,
      method: service.method,
    );
  }

  ///Delete cache for a certain [service]. This function will consider only [service.host] and [service.path].
  ///[service.queryParameters] will not be used to identify network data into cache.
  static deleteCacheForServicePath({required Service service}) {
    deleteCacheForPath(
      host: service.host,
      path: service.path,
      cacheType: service.cacheOptions.cacheType,
      method: service.method,
    );
  }

  ///Delete cache for a certain [url]. This function will consider only [host] and [path].
  ///It is important to know where network data are saved and set [cacheType].
  ///[cacheType] is used to identify the corresponding [cacheManger] used to save the network data,
  ///if [cacheType] is different from [cacheManger.cacheType] this function will not delete correctly the cache.
  static deleteCacheForPath({
    required Host host,
    required String path,
    required CacheType cacheType,
    HttpMethod method = HttpMethod.post,
  }) {
    final cacheManager = _getManagerToDeleteCache(
      host: host,
      method: method,
      cacheType: cacheType,
    );
    if (cacheManager != null) {
      cacheManager
          .deleteByPrimaryKey(path, requestMethod: method.value)
          .then((value) => Logger.instance.info('Deleted all cache'))
          .catchError((error) {
        Logger.instance.error(error);
      });
    }
  }

  ///Delete cache for a certain [url]. This function will consider only [host] and [path] and [queryParameters].
  ///It is important to know where network data are saved and set [cacheType].
  ///[cacheType] is used to identify the corresponding [cacheManger] used to save the network data,
  ///if [cacheType] is different from [cacheManger.cacheType] this function will not delete correctly the cache.
  static deleteCacheForUri({
    required Host host,
    required String path,
    required CacheType cacheType,
    Map<String, dynamic>? queryParameters,
    HttpMethod method = HttpMethod.post,
  }) {
    final cacheManager = _getManagerToDeleteCache(
      host: host,
      method: method,
      cacheType: cacheType,
    );
    if (cacheManager != null) {
      cacheManager
          .deleteByPrimaryKeyAndSubKey(
            path,
            requestMethod: method.value,
            queryParameters: queryParameters,
          )
          .then((value) =>
              Logger.instance.info('cache deleted for url: $host$path'))
          .catchError((error) {
        Logger.instance.error(error);
      });
    }
  }

  ///Function that returns the [cacheManager] from [_managers] that will take care of the [service] cache management.
  ///To identify the [cacheManager] will be used [service.host], [service.method], [service.cacheOptions.cacheType].
  ///If [_managers] does not contain the corresponded [cacheManager], it is created and added to the [_managers].
  static CacheManager? _findOrCreateManager({required Service service}) {
    try {
      final cacheManager = _managers?.firstWhere((manager) =>
          manager.host.value == service.host.value &&
          manager.method.value == service.method.value &&
          manager.cacheType.isEqual(service.cacheOptions.cacheType));
      return cacheManager;
    } catch (error) {
      return _createAndAddManager(service: service);
    }
  }

  ///This function returns [cacheManager] created using [service.host], [service.method] and [service.cacheType].
  ///The manager is also added to [_managers].
  static CacheManager _createAndAddManager({required Service service}) {
    final newManager = CacheManager(
        host: service.host,
        method: service.method,
        cacheType: service.cacheOptions.cacheType);
    _managers != null ? _managers?.add(newManager) : _managers = {newManager};
    return newManager;
  }

  ///Function that returns the [cacheManager] from [_managers] that will take care of cache management.
  ///To identify the [cacheManager] will be used [host], [method], [cacheType].
  ///If [_managers] does not contain the corresponded [cacheManager], the function returns null.
  static CacheManager? _getManagerToDeleteCache({
    required Host host,
    required HttpMethod method,
    required CacheType cacheType,
  }) {
    if (_managers?.isNotEmpty == true) {
      try {
        final cacheManager = _managers?.firstWhere((manager) =>
            manager.host.value == host.value &&
            manager.method.value == method.value &&
            manager.cacheType.isEqual(cacheType));
        return cacheManager;
      } catch (error) {
        return null;
      }
    } else {
      return null;
    }
  }
}
