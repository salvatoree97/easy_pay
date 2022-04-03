import 'dart:io';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';

///[OAuthInterceptor] class is used to intercept request and push Bearer token if present
class OAuthInterceptor extends BaseInterceptor {
  static const authorizationHeader = "Authorization";

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //Check if Bearer injection is required by service
    if (service.isUnderOAuth == true &&
        FirebaseAuth.instance.currentUser != null) {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
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
      final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      var options = err.requestOptions;
      options.headers[authorizationHeader] = 'Bearer $token';
      await _retry(options).catchError((error) {
        if (error.response?.statusCode == HttpStatus.unauthorized ||
            error.response?.statusCode == HttpStatus.forbidden) {
          Logger.instance.error('Refresh della sessione fallito');
          // NavigationService.instance.navigateToAndRemoveUntil(
          //     AppRoutes.LOGIN_SCREEN, (_) => false,
          //     arguments: {
          //       'isFromTabBar': true,
          //     });
          handler.reject(error);
        }
        super.onError(error, handler);
      });
    } catch (error) {
      // NavigationService.instance.navigateToAndRemoveUntil(
      //     AppRoutes.LOGIN_SCREEN, (_) => false,
      //     arguments: {
      //       'isFromTabBar': true,
      //     });
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
