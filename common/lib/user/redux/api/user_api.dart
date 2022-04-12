import 'package:common/common.dart';
import 'package:common/user/models/user_model.dart';
import 'package:common/user/redux/service/get_user/get_user_request.dart';
import 'package:common/user/redux/service/get_user/get_user_service.dart';

class UserApi {
  static Future<UserModel> getUser({required String email}) {
    final service = GetUserService(
      requestInput: GetUserRequest(email: email),
    );
    return NetworkManager(PackageConfiguration.configuration.interceptors)
        .request(service: service);
  }
}
