import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserState {
  final bool isLoading;
  final bool error;
  final firebase_auth.User? user;

  UserState(
    this.isLoading,
    this.error,
    this.user,
  );

  factory UserState.initial() => UserState(false, false, null);

  UserState copyWith({
    bool? isLoading,
    bool? error,
    firebase_auth.User? user,
  }) {
    return UserState(
      isLoading ?? this.isLoading,
      error ?? this.error,
      user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          user == other.user;

  @override
  int get hashCode =>
      isLoading.hashCode ^ user.hashCode ^ error.hashCode ^ user.hashCode;
}
