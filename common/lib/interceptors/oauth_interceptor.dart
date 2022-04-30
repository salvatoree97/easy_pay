import 'dart:io';
import 'package:common/app/package_configuration.dart';
import 'package:common/app/routes.dart';
import 'package:common/firebase/firebase_auth_service.dart';
import 'package:core/core.dart';

///[OAuthInterceptor] class is used to intercept request and push Bearer token if present
class OAuthInterceptor extends BaseInterceptor {
  static const authorizationHeader = "Authorization";

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //Check if Bearer injection is required by service
    if (service.isUnderOAuth == true &&
        FirebaseAuthService.instance.currentUser != null) {
      final token =
          await FirebaseAuthService.instance.currentUser!.getIdToken();
      options.headers[authorizationHeader] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null || !service.isUnderOAuth) {
      return super.onError(err, handler);
    }

    if (err.response?.statusCode != HttpStatus.unauthorized &&
        err.response?.statusCode != HttpStatus.forbidden) {
      return super.onError(err, handler);
    }

    // If not call refresh
    Logger.instance.warning('Refresh della sessione in corso');
    try {
      final token =
          await FirebaseAuthService.instance.currentUser?.getIdToken(true);
      var options = err.requestOptions;
      options.headers[authorizationHeader] = 'Bearer $token';
      await _retry(options).catchError((error) {
        if (error.response?.statusCode == HttpStatus.unauthorized ||
            error.response?.statusCode == HttpStatus.forbidden) {
          Logger.instance.error('Refresh della sessione fallito');
          PackageConfiguration.navigationService.pushAndRemoveUntil(
            AppRoutes.initialScreen,
            (_) => false,
            arguments: true,
          );
          handler.reject(error);
        }
        super.onError(error, handler);
      });
    } catch (error) {
      PackageConfiguration.navigationService.pushAndRemoveUntil(
        AppRoutes.initialScreen,
        (_) => false,
        arguments: true,
      );
      handler.reject(err);
    }

    dio.interceptors.requestLock.clear();
    //Call api to refresh current User -> Firebase and retry last call
  }
  // Clear queue waiting for an accesstoken not retrievable

  Future<Response<dynamic>?> _retry(RequestOptions? requestOptions) async {
    final Options options = Options(
      method: requestOptions?.method,
      headers: requestOptions?.headers,
    );
    return dio.request<dynamic>(
      requestOptions?.path ?? "",
      data: requestOptions?.data,
      queryParameters: requestOptions?.queryParameters,
      options: options,
    );
  }
}
