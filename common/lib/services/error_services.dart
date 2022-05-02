import 'dart:io';
import 'package:common/app/package_configuration.dart';
import 'package:common/models/common_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

typedef OnError = Function(dynamic);

class ErrorService {
  ErrorService._();

  static final ErrorService instance = ErrorService._();

  void showError({
    dynamic error,
    BuildContext? context,
  }) {
    Logger.instance.error(error);
    final commonError =
        error == null ? CommonError.deafaultError : getCustomException(error);

    PackageConfiguration.navigationService.showSnackBar(
      context: context,
      message: commonError.errorMessage,
    );
  }

  CommonError getCustomException(dynamic exception) {
    if (exception is CommonError) return exception;
    if (exception == null) return CommonError.deafaultError;
    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case ErrorCode.notAuthorizedType:
        case ErrorCode.invalidPassword:
          return CommonError.notAuthorized;
        default:
          return CommonError.deafaultError;
      }
    }
    if (exception is SocketException) {
      return CommonError.noInternetConnection;
    }

    return CommonError.deafaultError;
  }

  String getShowableMessage(dynamic exception) {
    if (exception is ResponseException) {
      return exception.errorDescription;
    }
    if (exception is CommonError) {
      return exception.errorMessage;
    }
    return CommonError.deafaultError.errorMessage;
  }
}
