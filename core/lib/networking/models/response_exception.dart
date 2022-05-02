import 'dart:convert';
import 'package:dio/dio.dart';

extension ResponseExceptionConvertible on DioError {
  ResponseException toResponseException() {
    dynamic dataToDecode;
    if (response?.data is Map<String, dynamic>) {
      dataToDecode = response?.data;
    } else {
      dataToDecode = json.decode(response?.data);
    }
    return ResponseException.fromJson(dataToDecode);
  }
}

///[ResponseException] is used to handle response exeptions.
///It should be create passing response body in [ResponseException.fromJson]
class ResponseException implements Exception {
  final String errorCode;
  final String errorDescription;

  ResponseException({
    required this.errorCode,
    required this.errorDescription,
  }) : super();

  @override
  String toString() {
    return '''Network request failed with error of type: $errorCode and message: $errorDescription''';
  }

  factory ResponseException.fromJson(Map<String, dynamic> json) {
    return ResponseException(
      errorCode: json['errorCode'],
      errorDescription: json['errorDescription'],
    );
  }
}
