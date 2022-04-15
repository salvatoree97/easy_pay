import 'package:common/common.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      userState: userReducer(state.userState, action),
      retailsState: retailsReducer(state.retailsState, action));
}
