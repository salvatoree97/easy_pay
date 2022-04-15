import 'package:common/retails/model/retail_model.dart';

class RetailsAction {}

class RetailsFetchRequested extends RetailsAction {}

class RetailsFetchFailed extends RetailsAction {}

class RetailsFetchSucceded extends RetailsAction {
  final List<RetailModel> retails;
  RetailsFetchSucceded(this.retails);
}

class RetailsSearchAction extends RetailsAction {
  final String? searchText;
  RetailsSearchAction(this.searchText);
}
