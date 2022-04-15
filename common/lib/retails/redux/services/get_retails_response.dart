import 'package:common/retails/model/retail_model.dart';
import 'package:core/core.dart';

class GetRetailsResponse {
  final List<RetailModel> retails;

  GetRetailsResponse({required this.retails});

  factory GetRetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetRetailsResponse(
      retails: json.getListFromKey(
        'retails',
        map: (retailJson) => RetailModel.fromJson(retailJson),
      ),
    );
  }
}
