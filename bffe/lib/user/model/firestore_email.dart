import 'package:bffe/model/encodable.dart';

class FirestoreEmail extends Encodable {
  final String email;

  FirestoreEmail(this.email);

  @override
  Map<String, dynamic> toJson() => {};
}
