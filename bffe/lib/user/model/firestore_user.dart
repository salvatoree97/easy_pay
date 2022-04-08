import 'package:bffe/model/encodable.dart';
import 'package:core/core.dart';

class FirestoreUser extends Encodable {
  final String name;
  final String lastname;
  final String email;

  FirestoreUser({
    required this.email,
    required this.name,
    required this.lastname,
  });

  Map<String, dynamic> toPresentationLayerJson() => {
        'name': name,
        'lastname': lastname,
        'email': email,
      };

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'lastname': lastname,
      };

  factory FirestoreUser.fromJson(Map<String, dynamic> json) {
    return FirestoreUser(
      name: json.getRequiredKey('name'),
      lastname: json.getRequiredKey('lastname'),
      email: json.getRequiredKey('email'),
    );
  }
}
