import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bffe/interceptor/bffe_interceptor.dart';
import 'package:bffe/model/bffe_service.dart';
import 'package:bffe/model/cloud_firestore_collection_reference.dart';
import 'package:bffe/model/encodable.dart';

class BffeFirestoreExecutor {
  static Future<dynamic> execute(
    BffeService<Encodable> service,
    List<BffeInterceptor> interceptors,
  ) {
    interceptors.forEach((inter) => inter.onRequest(service));

    switch (service.type) {
      case CollectionRequestType.set:
        return BffeFirestoreExecutorWrapper.firestoreSet(
          service,
          interceptors,
        );
      case CollectionRequestType.get:
        return BffeFirestoreExecutorWrapper.firestoreGet(
          service,
          interceptors,
        );
    }
  }
}

class BffeFirestoreExecutorWrapper {
  static Future<DocumentSnapshot<Map<String, dynamic>>> firestoreGet(
    BffeService service,
    List<BffeInterceptor> interceptors,
  ) async {
    await service.throwableSerialize(service.initialObjectJson);
    try {
      final response = await FirebaseFirestore.instance
          .collection(service.collection)
          .doc(service.id)
          .get();
      interceptors.forEach((inter) => inter.onResponse(service, response));
      return response;
    } catch (error) {
      interceptors.forEach((inter) => inter.onError(service, error));
      rethrow;
    }
  }

  static Future<void> firestoreSet(
    BffeService<Encodable> service,
    List<BffeInterceptor> interceptors,
  ) async {
    final objectToSave =
        await service.throwableSerialize(service.initialObjectJson);
    try {
      final response = await FirebaseFirestore.instance
          .collection(service.collection)
          .doc(service.id)
          .set(objectToSave.toJson());
      interceptors.forEach((inter) => inter.onResponse(service, null));
      return response;
    } catch (error) {
      interceptors.forEach((inter) => inter.onError(service, error));
      rethrow;
    }
  }
}
