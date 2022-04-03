import 'package:common/common.dart';
import 'package:easy_pay/app/environment.dart';
import 'package:easy_pay/app/navigation_service.dart';

class Configuration implements AppConfiguration {
  late Environment environment;
  late Host appHost;
  late Store<AppState> appStore;

  Configuration._() {
    PackageConfiguration.configuration = this;
  }

  static final Configuration instance = Configuration._();

  @override
  NavigationServiceInterface get navigationService =>
      NavigationService.instance;

  @override
  Host get host => appHost;

  @override
  String get mockDirectory => 'assets/mock';

  @override
  Store<AppState> get store => appStore;

  @override
  Set<BaseInterceptor> get interceptors {
    switch (environment) {
      case Environment.development:
        return {
          ProxyInterceptor(),
          DebugInterceptor(),
          MockInterceptor(),
          OAuthInterceptor(),
        };
      case Environment.store:
        return {
          OAuthInterceptor(),
        };
      default:
        return {};
    }
  }
}
