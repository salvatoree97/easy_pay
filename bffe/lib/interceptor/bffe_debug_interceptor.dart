import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bffe/interceptor/bffe_interceptor.dart';
import 'package:bffe/model/bffe_service.dart';
import 'package:core/core.dart';

class BffeDebugInterceptor extends BffeInterceptor {
  @override
  void onRequest(
    BffeService service,
  ) {
    Logger.instance.info(
      '🟡Request: '
      'service: ${service.toString()}',
    );
  }

  @override
  void onResponse(
    BffeService service,
    DocumentSnapshot<Map<String, dynamic>>? response,
  ) {
    Logger.instance.info(
      '🔵Response for service: ${service.toString()}'
      '\ndocId: ${response?.id}'
      '\ndocData: ${response?.data()}',
    );
  }

  @override
  void onError(BffeService service, Object error) {
    Logger.instance.info(
      '🛑Response for service: ${service.toString()}: '
      '\nerror: ${error.toString()}',
    );
  }
}
