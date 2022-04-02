import 'package:core/networking/models/http_request.dart';

///[HttpRequestConvertible] encapsulate method to generate an HttpRequest
abstract class HttpRequestConvertible {
  ///Using [asHttpRequest] to generate an HttpRequest.
  HttpRequest get asHttpRequest;
}
