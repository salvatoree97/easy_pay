// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:core/logger/logger.dart';
import 'package:core/networking/configuration/network_manager_configuration.dart';
import 'package:core/networking/interceptors/base_interceptor.dart';
import 'package:core/networking/models/http_request.dart';
import 'package:core/networking/models/response_exception.dart';
import 'package:core/networking/service/service.dart';

/// Use this class to send any request to the server. Pass to request function the custom service
class NetworkManager {
  static late NetworkManagerConfiguration configuration;
  final Set<BaseInterceptor>? interceptors;

  NetworkManager(this.interceptors);

  ///Call NetworkManager.instance.request and pass the correct service. Use the expected model for the responsen as [RequestOutput] (Generic).
  ///Use catchError to handle exceptions.
  Future<RequestOutput> request<RequestOutput>({
    required Service<RequestOutput> service,
  }) async {
    final HttpRequest request = service.asHttpRequest;
    final dio = Dio(request.baseOptions);
    _setUpInterceptors(dio, service);
    try {
      final response = await dio.request(
        request.service.path,
        data: request.service.data,
        queryParameters: request.service.queryParameters,
        options: request.options,
      );
      return _handleResponse(response: response, service: service);
    } catch (exeption) {
      throw _handleException(exeption as Exception, service: service);
    } finally {
      dio.close();
    }
  }

  ///Function used to setup [interceptors] passed by [NetworkManager] constructor.
  void _setUpInterceptors(Dio dio, Service service) {
    interceptors?.forEach((interceptor) {
      interceptor.service = service;
      interceptor.dio = dio;
      interceptor.configuration = configuration;
    });
    dio.interceptors.addAll(interceptors ?? {});
  }

  ///This function decode response body and return the model exepted if 200 <= [response.statusCode] > 299
  ///and thorw an exeption if [response.statusCode] > 299
  dynamic _handleResponse({
    required Response? response,
    required Service service,
  }) {
    try {
      if (response == null) {
        throw ResponseException(
          type: "NullResponse",
          message: "The response is null",
        );
      } else {
        //This part is usefull for empty body
        if (response.data == "") return service.serialize({});

        if (response.data is String) {
          return service.serialize(json.decode(response.data));
        }
        return service.serialize(response.data);
      }
    } on FormatException catch (exception) {
      Logger.instance.error("That string didn't look like Json.");
      throw exception;
    } on NoSuchMethodError catch (exception) {
      Logger.instance.error('That string was null!');
      throw exception;
    } catch (exception) {
      Logger.instance
          .error('Error during serialize of responseData: ${response?.data}');
      throw exception;
    }
  }

  Exception _handleException(Exception exception, {Service? service}) {
    if (exception is DioError) {
      if (exception.error is SocketException) {
        return const SocketException('No internet connection');
      }
      return exception;
    }
    return exception;
  }
}
