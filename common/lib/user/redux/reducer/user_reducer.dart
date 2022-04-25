import 'package:common/common.dart';
import 'package:common/user/redux/action/user_actions.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, UserRegistrationRequested>(_startRegistration),
  TypedReducer<UserState, UserRegistrationSucceded>(_registrationSucceded),
  TypedReducer<UserState, UserRegistrationFailed>(_registrationFailed),
  TypedReducer<UserState, UserFetchRequested>(_startUserFetch),
  TypedReducer<UserState, UserFetchSucceded>(_userFetchSucceded),
  TypedReducer<UserState, UserFetchFailed>(_userFetchFailed),
  TypedReducer<UserState, UserLoginRequested>(_userLogin),
  TypedReducer<UserState, UserLoginSuccesful>(_userLoginSucceded),
  TypedReducer<UserState, UserLoginFailed>(_userLoginFailed),
]);

UserState _startRegistration(UserState userState, dynamic action) {
  return userState.copyWith(
    isLoading: true,
    error: false,
  );
}

UserState _registrationSucceded(
  UserState userState,
  UserRegistrationSucceded action,
) {
  return userState.copyWith(
    firebaseUser: action.firebaseUser,
    isLoading: false,
    error: false,
  );
}

UserState _registrationFailed(
  UserState userState,
  UserRegistrationFailed action,
) {
  return userState.copyWith(
    isLoading: false,
    error: false,
  );
}

UserState _startUserFetch(
  UserState userState,
  dynamic action,
) {
  return userState.copyWith(
    isLoading: true,
    error: false,
  );
}

UserState _userFetchSucceded(
  UserState userState,
  UserFetchSucceded action,
) {
  return userState.copyWith(
    firebaseUser: action.firebaseUser,
    user: action.user,
    error: false,
    isLoading: false,
  );
}

UserState _userFetchFailed(
  UserState userState,
  UserFetchFailed failed,
) {
  return userState.copyWith(
    isLoading: false,
    error: true,
    firebaseUser: null,
  );
}

UserState _userLogin(
  UserState userState,
  dynamic action,
) {
  return userState.copyWith(
    isLoading: true,
    error: false,
  );
}

UserState _userLoginSucceded(
  UserState userState,
  UserLoginSuccesful action,
) {
  return userState.copyWith(
    isLoading: false,
    error: false,
    firebaseUser: action.firebaseUser,
  );
}

UserState _userLoginFailed(
  UserState userState,
  UserLoginFailed action,
) {
  return userState.copyWith(
    isLoading: false,
    error: true,
  );
}
