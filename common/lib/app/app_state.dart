import 'package:common/retails/redux/retails_state.dart';
import 'package:common/user/redux/user_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final UserState userState;
  final RetailsState retailsState;

  const AppState({
    required this.userState,
    required this.retailsState,
  });

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      retailsState: RetailsState.initial(),
    );
  }

  AppState copyWith({
    UserState? userState,
    RetailsState? retailsState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      retailsState: retailsState ?? this.retailsState,
    );
  }

  @override
  int get hashCode => userState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          userState == other.userState &&
          retailsState == other.retailsState;
}
