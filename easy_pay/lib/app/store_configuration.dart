import 'package:common/common.dart';
import 'package:easy_pay/app/app_reducer.dart';

Store<AppState> storeInitialise() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
  return store;
}
