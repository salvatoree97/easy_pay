import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bffe/model/bffe_service.dart';

abstract class BffeInterceptor {
  void onRequest(BffeService service);

  void onResponse(
    BffeService service,
    DocumentSnapshot<Map<String, dynamic>>? response,
  );

  void onError(
    BffeService service,
    Object error,
  );
}
