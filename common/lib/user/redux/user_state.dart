import 'package:common/firebase/firebase_auth_service.dart';
import 'package:common/user/models/user_model.dart';

class UserState {
  final bool isLoading;
  final bool error;
  final FirebaseUser? firebaseUser;
  final UserModel? user;

  UserState(
    this.isLoading,
    this.error,
    this.firebaseUser,
    this.user,
  );

  factory UserState.initial() => UserState(false, false, null, null);

  UserState copyWith({
    bool? isLoading,
    bool? error,
    FirebaseUser? firebaseUser,
    UserModel? user,
  }) {
    return UserState(
      isLoading ?? this.isLoading,
      error ?? this.error,
      firebaseUser ?? this.firebaseUser,
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
          firebaseUser == other.firebaseUser &&
          user == other.user;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      firebaseUser.hashCode ^
      error.hashCode ^
      firebaseUser.hashCode ^
      user.hashCode;
}
