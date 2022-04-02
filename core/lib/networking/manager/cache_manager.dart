import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:core/networking/models/cache_type.dart';
import 'package:core/networking/models/host.dart';
import 'package:core/networking/models/http_method.dart';

class CacheManager extends DioCacheManager {
  final Host host;
  final HttpMethod method;
  final CacheType cacheType;

  CacheManager({
    required this.host,
    this.method = HttpMethod.post,
    this.cacheType = CacheType.memory,
  }) : super(
          CacheConfig(
            baseUrl: host.value,
            defaultRequestMethod: method.value,
            skipDiskCache: cacheType.skipDiskCache,
            skipMemoryCache: cacheType.skipMemoryCache,
          ),
        );
}
