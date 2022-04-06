import 'package:common/firebase/firebase_auth_service.dart';

abstract class UserAction {}

class UserRegistrationRequested extends UserAction {}

class UserRegistrationSucceded extends UserAction {
  final FirebaseUser firebaseUser;

  UserRegistrationSucceded({
    required this.firebaseUser,
  });
}

class UserRegistrationFailed extends UserAction {}

//SPLASH SCREEN
class UserFetchRequested extends UserAction {}

class UserFetchSucceded extends UserAction {
  final FirebaseUser firebaseUser;

  UserFetchSucceded({
    required this.firebaseUser,
  });
}

class UserFetchFailed extends UserAction {}

//LOGIN
class UserLoginRequested extends UserAction {}

class UserLoginSuccesful extends UserAction {
  final FirebaseUser firebaseUser;
  UserLoginSuccesful(this.firebaseUser);
}

class UserLoginFailed extends UserAction {}
