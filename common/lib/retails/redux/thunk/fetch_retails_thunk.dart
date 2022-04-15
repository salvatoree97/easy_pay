import 'package:common/common.dart';
import 'package:common/retails/redux/action/retails_action.dart';
import 'package:common/retails/redux/api/retails_api.dart';

ThunkAction<AppState> fetchRetailsThunk() {
  return (Store<AppState> store) async {
    store.dispatch(RetailsFetchRequested());
    try {
      final retails = await RetailsApi.getRetails();
      store.dispatch(RetailsFetchSucceded(retails));
    } catch (error) {
      store.dispatch(RetailsFetchFailed());
    }
  };
}
