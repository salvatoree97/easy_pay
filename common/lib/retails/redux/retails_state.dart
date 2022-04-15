import 'package:common/retails/model/retail_model.dart';

class RetailsState {
  final bool isLoading;
  final bool error;
  final List<RetailModel> retails;

  RetailsState(
    this.isLoading,
    this.error,
    this.retails,
  );

  factory RetailsState.initial() => RetailsState(false, false, []);

  RetailsState copyWith({
    bool? isLoading,
    bool? error,
    List<RetailModel>? retails,
  }) {
    return RetailsState(
      isLoading ?? this.isLoading,
      error ?? this.error,
      retails ?? this.retails,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetailsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          retails == other.retails;

  @override
  int get hashCode => isLoading.hashCode ^ retails.hashCode ^ error.hashCode;
}
