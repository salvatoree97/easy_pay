import 'package:common/firebase/firebase_auth_service.dart';

class UserState {
  final bool isLoading;
  final bool error;
  final FirebaseUser? firebaseUser;

  UserState(
    this.isLoading,
    this.error,
    this.firebaseUser,
  );

  factory UserState.initial() => UserState(false, false, null);

  UserState copyWith({
    bool? isLoading,
    bool? error,
    FirebaseUser? firebaseUser,
  }) {
    return UserState(
      isLoading ?? this.isLoading,
      error ?? this.error,
      firebaseUser ?? this.firebaseUser,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          firebaseUser == other.firebaseUser;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      firebaseUser.hashCode ^
      error.hashCode ^
      firebaseUser.hashCode;
}
