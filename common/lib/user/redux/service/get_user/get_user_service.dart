import 'package:common/common.dart';
import 'package:common/user/models/user_model.dart';
import 'package:common/user/redux/service/get_user/get_user_request.dart';

class GetUserService extends Service<UserModel> {
  final GetUserRequest requestInput;
  GetUserService({
    required this.requestInput,
  }) : super(requestInput: requestInput);

  @override
  Map<String, String> get headers => {};

  @override
  Host get host => PackageConfiguration.configuration.host;

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  BaseContentType get contentType => CustomContentType.url;

  @override
  String get mockPath => '/getUser_mock';

  @override
  String get path => '/getUser';

  @override
  UserModel serialize(Map<String, dynamic> json) => UserModel.fromJson(json);
}
