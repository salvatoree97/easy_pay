import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

typedef FirebaseUser = firebase_auth.User;

class FirebaseAuthService {
  FirebaseAuthService._();

  static final instance = FirebaseAuthService._();

  FirebaseUser? get currentUser =>
      firebase_auth.FirebaseAuth.instance.currentUser;

  Future<firebase_auth.UserCredential> createUser({
    required String email,
    required String password,
  }) {
    return firebase_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<firebase_auth.UserCredential> loginWith({
    required String email,
    required String password,
  }) {
    return firebase_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
