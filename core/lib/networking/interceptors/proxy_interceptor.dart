import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:core/networking/interceptors/base_interceptor.dart';

///[ProxyInterceptor] class is used to intercept request and send to a certain proxy.
class ProxyInterceptor extends BaseInterceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (configuration.enabledProxyman && configuration.proxy != null) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        client.findProxy = (uri) => 'PROXY ${configuration.proxy}:9090';
        return client;
      };
    }
    super.onRequest(options, handler);
  }
}
