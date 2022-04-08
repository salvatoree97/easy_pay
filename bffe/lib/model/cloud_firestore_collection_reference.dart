abstract class CloudFirestoreCollectionReference {
  String? get id;

  CollectionRequestType get type;

  String get collection;
}

enum CollectionRequestType { get, set }
