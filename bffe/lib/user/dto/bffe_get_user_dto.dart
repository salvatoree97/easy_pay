import 'package:bffe/model/bffe_service.dart';
import 'package:bffe/model/cloud_firestore_collection_reference.dart';
import 'package:bffe/user/model/firestore_email.dart';
import 'package:core/core.dart';

class BffeGetUserDTO extends BffeService<FirestoreEmail> {
  BffeGetUserDTO(Map<String, dynamic> json) : super(json);

  @override
  String? get id => object?.email;

  @override
  String get collection => 'users';

  @override
  FirestoreEmail initializeFromJson(Map<String, dynamic> json) {
    return FirestoreEmail(json.getRequiredKey('email'));
  }

  @override
  Map<String, dynamic>? toPresentationLayerJson(Map<String, dynamic>? json) {
    return json;
  }

  @override
  Map<String, dynamic>? toJson() => {
        'email': object?.email,
      };

  @override
  CollectionRequestType get type => CollectionRequestType.get;
}
