import 'package:features/login/redux/biometrics_thunk.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formState;
  late AutovalidateMode _autovalidateMode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode()..addListener(_onPasswordFocusNodeListner);

    _emailController = TextEditingController()
      ..addListener(_textControllerListner);
    _passwordController = TextEditingController()
      ..addListener(_textControllerListner);

    _setInitialUsername();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _textControllerListner() {
    setState(() {});
  }

  _setInitialUsername() {
    UserManager.instance.fetchUsername().then((username) {
      if (username != null && username.isNotEmpty) {
        _emailController.text = username;
      }
    });
  }

  void _onPasswordFocusNodeListner() {
    if (_passwordController.text.isNotEmpty || !_passwordFocusNode.hasFocus) {
      return;
    }
    StoreProvider.of<AppState>(context).dispatch(
      biometricsThunk(
        username: _emailController.text,
        onReceivePasswordFromBiometrics: _onReceivePasswordFromBiometrics,
      ),
    );
  }

  _onReceivePasswordFromBiometrics(String password) {
    _passwordController.text = password;
    _setObscurePassword(true);
    _onButtonPressed();
  }

  bool get _isButtonEnabled {
    return (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty);
  }

  void _onButtonPressed() {
    if (_formState.currentState?.validate() == true) {
      StoreProvider.of<AppState>(context).dispatch(
        loginThunk(
          username: _emailController.text,
          password: _passwordController.text,
          onSuccess: _onSuccess,
          onEmailNotConfirmed: _onEmailNotConfirmed,
          onError: _onError,
        ),
      );
    }
    _autovalidateMode = AutovalidateMode.always;
    setState(() {});
  }

  void _setObscurePassword(bool isHidden) {
    setState(() => _obscurePassword = isHidden);
  }

  void _onSuccess() {
    PackageConfiguration.navigationService.pushAndRemoveUntil(
      AppRoutes.tabScreen,
      (_) => false,
    );
  }

  void _onError() {}

  void _onEmailNotConfirmed() {
    PackageConfiguration.navigationService
        .push(AppRoutes.registrationThirdStepScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: DefaultAppBar(
        title: S.of(context).login_title,
      ),
      body: CustomFormWidget(
        formState: _formState,
        autovalidateMode: _autovalidateMode,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimension.defaultPadding),
            child: Text(
              S.of(context).credentials_description,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).email_title,
            placeholder: S.of(context).email_placeholder,
            value: _emailController.text,
            validationRules: [
              IsFilled(errorMessage: S.of(context).required_error_message),
              IsEmail(errorMessage: S.of(context).email_format_error_message),
            ],
            controller: _emailController,
            onSubmitted: (_) => _passwordFocusNode.requestFocus(),
            focusNode: _emailFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).password_title,
            placeholder: S.of(context).password_placeholder,
            value: _passwordController.text,
            validationRules: [
              IsFilled(errorMessage: S.of(context).required_error_message),
            ],
            obscureText: _obscurePassword,
            suffixWidget: PasswordSuffixWidget(
              onTap: _setObscurePassword,
              isHidden: _obscurePassword,
            ),
            controller: _passwordController,
            onSubmitted: (_) => _onButtonPressed(),
            focusNode: _passwordFocusNode,
          ),
          const SizedBox(height: 20),
          Expanded(child: Container()),
          const SizedBox(height: 20),
          StoreConnector<AppState, UserState>(
            converter: (store) => store.state.userState,
            builder: (ctx, state) => CustomElevatedButton(
              title: S.of(context).continue_button_text,
              enabled: _isButtonEnabled,
              isLoading: state.isLoading,
              onPressed: _onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
