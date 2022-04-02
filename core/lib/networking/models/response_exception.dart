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
  final String type;
  final String message;
  final String? returnCode;

  ResponseException({
    required this.type,
    required this.message,
    this.returnCode,
  }) : super();

  @override
  String toString() {
    return '''Network request failed with error of type: $type and message: $message''';
  }

  factory ResponseException.fromJson(Map<String, dynamic> json) {
    if (json['__type'] == null && json['code'] != null) {
      return ResponseException(
        type: json['code'],
        message: json['message'],
      );
    } else {
      return ResponseException(
        type: json['__type'],
        message: json['message'],
      );
    }
  }
}
