///[CacheType] is used to set where save the response.
///[CacheType.disk] to save only on Disk.
///[CacheType.memory] to save only on RAM.
///[CacheType.diskAndRam] to save on Disk and RAM.
class CacheType {
  final bool skipDiskCache;
  final bool skipMemoryCache;
  const CacheType({this.skipDiskCache = false, this.skipMemoryCache = false});

  static const disk = CacheType(skipMemoryCache: true);
  static const memory = CacheType(skipDiskCache: true);
  static const diskAndRam = CacheType();

  bool isEqual(CacheType cacheType) {
    return cacheType.skipDiskCache == skipDiskCache &&
        cacheType.skipMemoryCache == skipMemoryCache;
  }
}
