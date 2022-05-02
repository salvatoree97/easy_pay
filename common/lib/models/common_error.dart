import 'package:core/core.dart';

class ErrorCode {
  static const notAuthorizedType = "user-not-found";
  static const invalidPassword = "wrong-password";
}

class CommonError {
  static final deafaultError = CommonError(
    'DEFAULT',
    S.current.default_error_message(''),
  );
  static final notAuthorized = CommonError(
    ErrorCode.notAuthorizedType,
    S.current.not_authorized_error_message,
  );
  static final noInternetConnection = CommonError(
    'NO_INTERNET',
    S.current.no_internet_error_message,
  );

  final String errorCode;
  final String errorMessage;

  CommonError(this.errorCode, this.errorMessage);
}
