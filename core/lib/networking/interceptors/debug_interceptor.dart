import 'package:core/networking/manager/network_manager.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:core/logger/logger.dart';
import 'package:core/networking/interceptors/base_interceptor.dart';

///[DebugInterceptor] class is used to intercept request and response and print them in debug console.
class DebugInterceptor extends BaseInterceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    Logger.instance.info(
      '🟡Request: '
      '\nurl: ${options.uri}'
      '\nmethod: ${options.method}'
      '\nheaders: ${options.headers}'
      '\nbody: ${options.data}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    bool isMocked =
        service.isMocked || NetworkManager.configuration.isAllMockEnabled;
    final bool isFromCache =
        response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) != null;
    final mockDirectory = isMocked ? service.mockPath : 'notMocked';
    Logger.instance.info(
      '🔵Response for url: ${response.requestOptions.uri}: '
      '\nisMocked: $isMocked'
      '\nmockDirectory: $mockDirectory, '
      '\nfromCache: $isFromCache, '
      '\nstatusCode: ${response.statusCode}, '
      '\nheader: ${response.headers}, '
      '\nbody: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;
    bool isMocked =
        service.isMocked || NetworkManager.configuration.isAllMockEnabled;
    final bool isFromCache =
        null != response?.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE);
    final mockDirectory = isMocked ? service.mockPath : 'notMocked';
    Logger.instance.info(
      '🛑Response for url: ${err.requestOptions.uri}: '
      '\nisMocked: $isMocked'
      '\nmockDirectory: $mockDirectory, '
      '\nfromCache: $isFromCache, '
      '\nstatusCode: ${response?.statusCode}, '
      '\nheader: ${response?.headers}, '
      '\nbody: ${response?.data},'
      '\nwith error: ${err.message},',
    );
    super.onError(err, handler);
  }
}
