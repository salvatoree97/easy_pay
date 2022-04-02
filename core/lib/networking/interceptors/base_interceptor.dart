import 'package:dio/dio.dart';
import 'package:core/networking/configuration/network_manager_configuration.dart';
import 'package:core/networking/service/service.dart';

///[Base Interceptor] encapsulates [service] variable for all custom interceptors.
class BaseInterceptor extends Interceptor {
  late Service service;
  late Dio dio;
  late NetworkManagerConfiguration configuration;
}
