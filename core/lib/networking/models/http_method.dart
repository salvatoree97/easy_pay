/// Custom HttpMethod that wrap a string value used for Request
class HttpMethod {
  final String value;

  const HttpMethod(this.value);

  static const HttpMethod get = HttpMethod('GET');
  static const HttpMethod post = HttpMethod('POST');
  static const HttpMethod put = HttpMethod('PUT');
  static const HttpMethod delete = HttpMethod('DELETE');
}
