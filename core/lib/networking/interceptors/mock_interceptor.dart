import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:core/networking/manager/network_manager.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/services.dart';
import 'package:core/logger/logger.dart';
import 'package:core/networking/interceptors/base_interceptor.dart';

///[MockInterceptor] class is used to intercept the request before sended and if [service.isMocked] is true return mocked response from [service.mockPath].
class MockInterceptor extends BaseInterceptor {
  static const mockStartedPath = 'assets/mock';
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!service.isMocked && !NetworkManager.configuration.isAllMockEnabled) {
      handler.next(options);
    } else {
      int milliseconds = (Random().nextDouble() * 2000).round();
      return Future.delayed(
        Duration(milliseconds: milliseconds),
        () async {
          try {
            final source = await rootBundle.loadString(
                '$mockStartedPath${service.mockPath}.json'); // test if file does not exist
            if (service.mockedStatusCode == HttpStatus.ok) {
              final response = Response(
                requestOptions: options,
                data: json.decode(source),
                statusCode: service.mockedStatusCode,
              );

              bool isFromCache =
                  response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) !=
                      null;
              Logger.instance.info(
                '🔵Response for url: ${options.uri}: '
                '\nisMocked: true'
                '\nmockDirectory: ${service.mockPath}, '
                '\nfromCache: $isFromCache,'
                '\nstatusCode: ${service.mockedStatusCode}, '
                '\nheader: ${options.headers}, '
                '\nbody: ${response.data}',
              );
              handler.resolve(response);
            } else {
              final dioError = DioError(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  data: '',
                  headers: Headers(),
                  statusCode: service.mockedStatusCode,
                  statusMessage: '',
                ),
              );
              bool isFromCache = dioError.response?.headers
                      .value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) !=
                  null;

              Logger.instance.info(
                '🛑Response for url: ${dioError.response?.requestOptions.uri}: '
                '\nisMocked: true'
                '\nmockDirectory: ${service.mockPath},'
                '\nfromCache: $isFromCache, '
                '\nstatusCode: ${dioError.response?.statusCode}, '
                '\nheader: ${dioError.response?.headers}, '
                '\nbody: ${dioError.response?.data}',
              );
              handler.reject(dioError);
            }
          } catch (exeption) {
            final dioError = DioError(
              requestOptions: options,
              response: Response(
                requestOptions: options,
                data: '',
                headers: Headers(),
                statusCode: service.mockedStatusCode,
                statusMessage: 'Error loading mock ${options.path}',
              ),
            );
            bool isFromCache = dioError.response?.headers
                    .value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) !=
                null;

            Logger.instance.info(
              '🛑Response for url: ${dioError.response?.requestOptions.uri}: '
              '\nisMocked: true'
              '\nmockDirectory: ${service.mockPath}, '
              '\nfromCache: $isFromCache, '
              '\nstatusCode: ${dioError.response?.statusCode}, '
              '\nheader: ${dioError.response?.headers}, '
              '\nbody: ${dioError.response?.data}',
            );

            handler.reject(dioError);
          }
        },
      );
    }
  }
}
