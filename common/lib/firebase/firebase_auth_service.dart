import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

typedef FirebaseUser = firebase_auth.User;

class FirebaseAuthService {
  FirebaseAuthService._();

  static final instance = FirebaseAuthService._();

  FirebaseUser? get currentUser =>
      firebase_auth.FirebaseAuth.instance.currentUser;
}
