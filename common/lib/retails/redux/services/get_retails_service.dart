import 'package:common/common.dart';
import 'package:common/retails/redux/services/get_retails_response.dart';

class GetRetailsService extends Service<GetRetailsResponse> {
  @override
  Map<String, String> get headers => {};

  @override
  Host get host => PackageConfiguration.configuration.host;

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  String get mockPath => '/getRetails_mock';

  @override
  String get path => '/getRetails';

  @override
  GetRetailsResponse serialize(Map<String, dynamic> json) =>
      GetRetailsResponse.fromJson(json);
}
