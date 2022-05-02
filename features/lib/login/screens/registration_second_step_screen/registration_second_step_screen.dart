import 'package:flutter/material.dart';
import 'package:common/common.dart';

class RegistrationSecondStepScreen extends StatefulWidget {
  final String name;
  final String lastname;
  final String fiscalCode;

  const RegistrationSecondStepScreen({
    Key? key,
    required this.name,
    required this.lastname,
    required this.fiscalCode,
  }) : super(key: key);

  @override
  State<RegistrationSecondStepScreen> createState() =>
      _RegistrationSecondStepScreenState();
}

class _RegistrationSecondStepScreenState
    extends State<RegistrationSecondStepScreen> {
  late GlobalKey<FormState> _formState;
  late AutovalidateMode _autovalidateMode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    _emailController = TextEditingController()
      ..addListener(_textControllerListner);
    _passwordController = TextEditingController()
      ..addListener(_textControllerListner);
    _confirmPasswordController = TextEditingController()
      ..addListener(_textControllerListner);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _textControllerListner() {
    setState(() {});
  }

  bool get _isButtonEnabled {
    return (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty);
  }

  void _setObscurePassword(bool isHidden) {
    setState(() => _obscurePassword = isHidden);
  }

  void _setObscureConfirmPassword(bool isHidden) {
    setState(() => _obscureConfirmPassword = isHidden);
  }

  void _onButtonPressed() {
    if (_formState.currentState?.validate() == true) {
      StoreProvider.of<AppState>(context).dispatch(
        registrationThunk(
          username: _emailController.text,
          password: _passwordController.text,
          name: widget.name,
          lastname: widget.lastname,
          userImage: null,
          onSuccess: () => PackageConfiguration.navigationService
              .push(AppRoutes.registrationThirdStepScreen),
          onError: _onError,
        ),
      );
    }
    _autovalidateMode = AutovalidateMode.always;
    setState(() {});
  }

  void _onError(dynamic error) {
    ErrorService.instance.showError(error: error, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: DefaultAppBar(
        title: S.of(context).registration_title,
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
              S.of(context).almost_done_message(widget.name),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimension.defaultPadding),
            child: Text(
              S.of(context).create_your_credentials_description,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).email_title,
            placeholder: S.of(context).email_placeholder,
            value: _emailController.text,
            validationRules: [
              IsEmail(errorMessage: S.of(context).email_format_error_message),
              IsFilled(errorMessage: S.of(context).required_error_message)
            ],
            controller: _emailController,
            onSubmitted: (_) => _passwordFocusNode.requestFocus(),
            focusNode: _emailFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).create_password_title,
            placeholder: S.of(context).password_placeholder,
            value: _passwordController.text,
            validationRules: [
              IsPassword(
                  errorMessage: S.of(context).password_format_error_message),
              IsFilled(errorMessage: S.of(context).required_error_message)
            ],
            obscureText: _obscurePassword,
            suffixWidget: PasswordSuffixWidget(
              onTap: _setObscurePassword,
              isHidden: _obscurePassword,
            ),
            controller: _passwordController,
            onSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
            focusNode: _passwordFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).confirm_password_title,
            placeholder: S.of(context).password_placeholder,
            value: _confirmPasswordController.text,
            validationRules: [
              IsPassword(
                  errorMessage: S.of(context).password_format_error_message),
              IsEqual(
                errorMessage: S.of(context).same_password_error_message,
                lastValue: _passwordController.text,
              ),
              IsFilled(errorMessage: S.of(context).required_error_message)
            ],
            obscureText: _obscureConfirmPassword,
            suffixWidget: PasswordSuffixWidget(
              onTap: _setObscureConfirmPassword,
              isHidden: _obscureConfirmPassword,
            ),
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            onSubmitted: (_) => _onButtonPressed(),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container()),
          const SizedBox(height: 20),
          StoreConnector<AppState, UserState>(
            converter: (store) => store.state.userState,
            builder: (_, vm) => CustomElevatedButton(
              title: S.of(context).continue_button_text,
              enabled: _isButtonEnabled,
              isLoading: vm.isLoading,
              onPressed: _onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
