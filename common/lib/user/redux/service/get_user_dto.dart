import 'package:bffe/bffe.dart';
import 'package:common/user/models/user_model.dart';

class GetUserDTO extends CloudFirestoreInputDTO<UserModel> {
  final String email;
  GetUserDTO({
    required this.email,
  });

  @override
  UserModel serialize(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
