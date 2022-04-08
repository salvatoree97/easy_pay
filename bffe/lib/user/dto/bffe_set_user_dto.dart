import 'package:bffe/model/bffe_service.dart';
import 'package:bffe/model/cloud_firestore_collection_reference.dart';
import 'package:bffe/user/model/firestore_user.dart';

class BffeSetUserDTO extends BffeService<FirestoreUser> {
  BffeSetUserDTO(Map<String, dynamic> json) : super(json);

  @override
  String? get id => object?.email;

  @override
  String get collection => 'users';

  @override
  FirestoreUser initializeFromJson(Map<String, dynamic> json) {
    return FirestoreUser.fromJson(json);
  }

  @override
  Map<String, dynamic>? toPresentationLayerJson(Map<String, dynamic>? json) {
    return object?.toPresentationLayerJson();
  }

  @override
  Map<String, dynamic>? toJson() => object?.toJson();

  @override
  CollectionRequestType get type => CollectionRequestType.set;
}
