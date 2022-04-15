import 'package:common/common.dart';
import 'package:common/retails/redux/services/get_retails_service.dart';

class RetailsApi {
  static Future<List<RetailModel>> getRetails() {
    return NetworkManager(PackageConfiguration.configuration.interceptors)
        .request(service: GetRetailsService())
        .then((response) => response.retails);
  }
}
