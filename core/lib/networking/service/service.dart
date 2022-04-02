import 'package:core/networking/models/cache_options.dart';
import 'package:core/networking/models/content_encoding.dart';
import 'package:core/networking/models/content_type.dart';
import 'package:core/networking/models/host.dart';
import 'package:core/networking/models/http_method.dart';
import 'package:core/networking/models/http_request.dart';
import 'package:core/networking/models/http_request_convertible.dart';
import 'package:dio/dio.dart';

///[Service] encapsulates the entire data necessary to create our requests.
abstract class Service<RequestOutput> extends HttpRequestConvertible {
  ///Service constructor: pass the model that will be used as input for the request.
  Service({dynamic requestInput}) {
    parameters = requestInput?.toJson();
  }

  ///Explicit [host] that will be used for request url.
  Host get host;

  ///Explicit [path] that will be append to [host] and use for request url.
  String get path;

  ///Explicit [method] of the request.
  HttpMethod get method;

  ///Explicit [headers] of the request.
  ///To [headers] will be added the (key, value) pair releated of [contentType.contentEncodingHeader].
  Map<String, String> get headers;

  ///The object used as parameters for the request. This value is setted by the [constructor] using [requestInput.toJson()]
  Map<String, dynamic>? parameters;

  ///Explicit [contentType] for the request: [contentEncoding] default value is ContentEncoding.utf8
  ///If needed add new type in ContentEncoding class.
  ContentEncoding get contentEncoding => ContentEncoding.utf8;

  ///Explicit [contentType] for the request: [contentType] default value is ContentType.json.
  ///This variable is used to set ['content-type'] key in request header.
  BaseContentType get contentType => CustomContentType.json;

  ///Use this function to map the responseJson in the exepted model. Typically used with model factory method: RequestOutput.fromJson(json).
  RequestOutput serialize(Map<String, dynamic> json);

  ///Set [cacheOptions] for the request. If [cacheOptions] is not setted the request will not be cached.
  CacheOptions get cacheOptions => CacheOptions();

  ///If true for request's response will be use the model decoded from [mockPath]. Default value is false.
  bool get isMocked => false;

  ///If true for request's response will be injected in request's header. Default value is true.
  bool get isUnderOAuth => true;

  ///When [isMocked] is true set this value to decide the response status code. Default value is 200.
  int get mockedStatusCode => 200;

  ///Entire path for mock file. Add mock file in a specific folder in your application and use [mockPath]
  ///to bring the file while using [isMocked] true.
  String get mockPath;

  ///Do not override this getter. Get query parameters,
  ///[queryParameters] return [requestInput.toJson()] as queryParameters when [contentType] is CustomContentType.url.
  ///When [contentType] is CustomContentType.json [data] is null.
  Map<String, dynamic>? get queryParameters {
    if (contentType is UrlContentType && parameters != null) {
      parameters?.removeWhere((key, value) => value == null);
      return parameters;
    }
    return null;
  }

  ///Do not override this getter. Get body of the request.
  ///[data] return [requestInput.toJson()] as parametere when [contentType] is CustomContentType.json
  ///When [contentType] is CustomContentType.url [data] is null.
  Map<String, dynamic>? get data {
    if ((contentType.shouldSetParametersAsData) && parameters != null) {
      return parameters;
    }
    return null;
  }

  String? get customPath {
    if (contentType is UrlListContentType && parameters != null) {
      var query = Transformer.urlEncodeMap(parameters ?? {});
      if (query.isNotEmpty) {
        final correctFinalPath = query.replaceAll(RegExp('%5B%5D'), '');
        query = correctFinalPath;
        return '$path?$query';
      }
    }
    return null;
  }

  @override
  HttpRequest get asHttpRequest => HttpRequest(this);
}
