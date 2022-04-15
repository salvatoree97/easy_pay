import 'package:common/retails/model/retail_model.dart';
import 'package:common/retails/redux/retails_state.dart';
import 'package:reselect/reselect.dart';

List<RetailModel> retails(RetailsState state) => state.retails;

final Selector<RetailsState, List<RetailModel>> allRetails =
    createSelector1(retails, (List<RetailModel> retails) {
  if (retails.isEmpty) {
    return [];
  }

  return retails;
});
