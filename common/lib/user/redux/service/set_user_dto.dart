import 'package:bffe/bffe.dart';
import 'package:common/user/models/user_model.dart';

class SetUserDTO extends CloudFirestoreInputDTO<UserModel> {
  final String email;
  final String lastname;
  final String name;

  SetUserDTO({
    required this.email,
    required this.lastname,
    required this.name,
  });

  @override
  UserModel serialize(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'lastname': lastname,
      };
}
