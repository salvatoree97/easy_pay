import 'package:common/common.dart';
import 'package:common/user/models/user_model.dart';
import 'package:common/user/redux/service/add_user/add_user_request.dart';

class AddUserService extends Service<UserModel> {
  final AddUserRequest requestInput;

  AddUserService({
    required this.requestInput,
  }) : super(requestInput: requestInput);

  @override
  Map<String, String> get headers => {};

  @override
  Host get host => PackageConfiguration.configuration.host;

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  String get mockPath => '/addUser';

  @override
  String get path => 'getUser';

  @override
  UserModel serialize(Map<String, dynamic> json) => UserModel.fromJson(json);
}
