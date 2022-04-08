import 'package:core/core.dart';

class UserModel {
  final String email;
  final String name;
  final String lastname;

  UserModel({
    required this.email,
    required this.name,
    required this.lastname,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'lastname': lastname,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json.getRequiredKey('email'),
      name: json.getRequiredKey('name'),
      lastname: json.getRequiredKey('lastname'),
    );
  }
}
