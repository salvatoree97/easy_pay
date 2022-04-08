library common;

export 'package:design/design.dart';
export 'package:core/core.dart';
export 'package:redux/redux.dart';
export 'package:flutter_redux/flutter_redux.dart';
export 'package:redux_thunk/redux_thunk.dart';
export 'package:bffe/bffe.dart';

///[]
export 'package:common/interceptors/oauth_interceptor.dart';
export 'package:common/services/route_resolver_service_interface.dart';
export 'package:common/models/notification_model.dart';

///[Firebase]
export 'package:common/firebase/firebase_service.dart';
export 'package:common/firebase/firebase_auth_service.dart';
export 'package:common/firebase/push_notification_service.dart';

export 'package:common/app/app_configuration.dart';
export 'package:common/app/app_state.dart';
export 'package:common/app/package_configuration.dart';
export 'package:common/app/routes.dart';

///[User]
export 'package:common/user/redux/reducer/user_reducer.dart';
export 'package:common/user/redux/user_state.dart';
export 'package:common/user/redux/thunk/registration_thunk.dart';
export 'package:common/user/redux/thunk/reload_user_thunk.dart';
export 'package:common/user/redux/thunk/email_verification_thunk.dart';
export 'package:common/user/redux/thunk/fetch_user_thunk.dart';
