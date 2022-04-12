import 'package:common/app/app_configuration.dart';
import 'package:design/design.dart';

class PackageConfiguration {
  static late AppConfiguration configuration;

  static NavigationServiceInterface get navigationService {
    return configuration.navigationService;
  }
}
