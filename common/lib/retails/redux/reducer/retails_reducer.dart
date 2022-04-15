import 'package:common/retails/redux/action/retails_action.dart';
import 'package:common/retails/redux/retails_state.dart';
import 'package:redux/redux.dart';

final retailsReducer = combineReducers<RetailsState>([
  TypedReducer<RetailsState, RetailsFetchRequested>(_startFetchRetails),
  TypedReducer<RetailsState, RetailsFetchSucceded>(_retailsFetchSucceded),
  TypedReducer<RetailsState, RetailsFetchFailed>(_retailsFetchFailed),
]);

RetailsState _startFetchRetails(RetailsState retailsState, dynamic action) {
  return retailsState.copyWith(
    isLoading: true,
    error: false,
  );
}

RetailsState _retailsFetchSucceded(
  RetailsState retailsState,
  RetailsFetchSucceded action,
) {
  return retailsState.copyWith(
    retails: action.retails,
    isLoading: false,
    error: false,
  );
}

RetailsState _retailsFetchFailed(
  RetailsState retailsState,
  RetailsFetchFailed action,
) {
  return retailsState.copyWith(
    isLoading: false,
    error: true,
  );
}
