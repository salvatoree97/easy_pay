import 'package:bffe/model/cloud_firestore_collection_reference.dart';
import 'package:bffe/model/cloud_firestore_dto.dart';

abstract class BffeService<Encodable> extends CloudFirestoreBffeDTO<Encodable>
    implements CloudFirestoreCollectionReference {
  BffeService(Map<String, dynamic> json) : super(json);

  @override
  String toString() {
    return '''
      \nserviceJson: $initialObjectJson,
      \nobject: ${object.toString()},
      \ntype: $type,
      \ncollection: $collection,
      \nid: $id,
    ''';
  }
}
