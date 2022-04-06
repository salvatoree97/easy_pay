import 'package:common/app/app_state.dart';
import 'package:core/core.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> emailVerificationThunk() =>
    (Store<AppState> store) async {
      final firebaseUser = store.state.userState.firebaseUser;
      Logger.instance
          .info('Send for sendEmailVerification with user: $firebaseUser');
      try {
        await firebaseUser?.sendEmailVerification();
      } catch (error) {
        Logger.instance.error(error);
      }
    };
