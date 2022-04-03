import 'package:common/app/app_state.dart';
import 'package:design/design.dart';
import 'package:redux/redux.dart';

abstract class AppConfiguration {
  String get mockDirectory;
  Host get host;
  NavigationServiceInterface get navigationService;

  Set<BaseInterceptor> get interceptors;
  Store<AppState> get store;
}
