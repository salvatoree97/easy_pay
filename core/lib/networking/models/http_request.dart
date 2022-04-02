import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:core/networking/service/service.dart';

///[HttpRequest] receives a [Service] object with all the request's information
class HttpRequest extends RequestOptions {
  final Service service;

  HttpRequest(this.service)
      : super(
          baseUrl: service.host.value,
          method: service.method.value,
          headers: service.headers,
          path: service.customPath ?? service.path,
          queryParameters: service.queryParameters,
          data: service.data,
          contentType: service.contentType.contentEncodingHeader,
          requestEncoder: service.contentType.requestEncoder,
        );

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: service.host.value,
        method: service.method.value,
        headers: service.headers,
        contentType: service.contentType.contentEncodingHeader,
      );

  Options get options => Options(
        requestEncoder: service.contentType.requestEncoder,
        headers: service.headers,
        method: service.method.value,
        contentType: service.contentType.contentEncodingHeader,
        extra: service.cacheOptions.useCache
            ? service.cacheOptions.value?.extra
            : null,
      );

  Encoding? get encoding => Encoding.getByName(service.contentEncoding.value);
}
