import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RetailsState state;
  String? serchText;
  final List<RetailModel> retails;

  HomeViewModel({
    required this.state,
    required this.retails,
  });

  factory HomeViewModel.fromStore(
    Store<AppState> store, {
    Function(String)? onTextChanged,
  }) {
    return HomeViewModel(
      state: store.state.retailsState,
      retails: allRetails(store.state.retailsState),
    );
  }

  void updateSearchText(String text) {
    serchText = text;
    notifyListeners();
  }

  List<RetailModel> get filteredRetails {
    if (serchText == null) {
      return retails;
    }

    return retails
        .where((retail) =>
            retail.name.toLowerCase().contains(serchText!) ||
            (retail.description ?? "").toLowerCase().contains(serchText!))
        .toList();
  }
}
