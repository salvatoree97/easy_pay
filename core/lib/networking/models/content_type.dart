import 'dart:io';

import 'package:dio/dio.dart';

///[Content-Type] is used to set request content-type and the relative header part

extension CustomContentType on BaseContentType {
  static final BaseContentType json = JsonContentType();
  static final BaseContentType url = UrlContentType();
  static final BaseContentType urlWithList = UrlListContentType();
  static final BaseContentType urlBody = UrlBodyContentType();
}

abstract class BaseContentType {
  String? get value;

  String? get contentEncodingHeader;

  bool get shouldSetParametersAsData => true;

  bool get shouldUseRequestEncoder => false;

  List<int> Function(String, RequestOptions)? get requestEncoder => null;
}

class JsonContentType extends BaseContentType {
  @override
  String get value => 'json';

  @override
  String get contentEncodingHeader => ContentType.json.value;
}

class UrlContentType extends BaseContentType {
  @override
  String get value => 'url';

  @override
  bool get shouldSetParametersAsData => false;

  @override
  String get contentEncodingHeader => Headers.formUrlEncodedContentType;
}

class UrlListContentType extends BaseContentType {
  @override
  String get value => 'urlWitList';

  @override
  bool get shouldSetParametersAsData => false;

  @override
  String? get contentEncodingHeader => null;
}

class UrlBodyContentType extends BaseContentType {
  @override
  String get value => 'url';

  @override
  bool get shouldSetParametersAsData => true;

  @override
  String get contentEncodingHeader => Headers.formUrlEncodedContentType;
}
