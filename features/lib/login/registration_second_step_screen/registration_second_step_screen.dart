import 'package:flutter/material.dart';
import 'package:common/common.dart';

class RegistrationSecondStepScreen extends StatefulWidget {
  final String name;
  final String surname;
  final String fiscalCode;

  const RegistrationSecondStepScreen({
    Key? key,
    required this.name,
    required this.surname,
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

  void _onButtonPressed() {
    if (_formState.currentState?.validate() == true) {
      StoreProvider.of<AppState>(context).dispatch(
        registrationThunk(
          username: _emailController.text,
          password: _passwordController.text,
          userImage: null,
          onSuccess: () => PackageConfiguration.navigationService
              .push(AppRoutes.registrationSecondStepScreen),
        ),
      );
      // PackageConfiguration.navigationService.push(
      //   AppRoutes.registrationSecondStepScreen,
      //   arguments: {
      //     'name': _nameController.text,
      //     'surname': _surnameController.text,
      //     'fiscalCode': _fiscalCodeController.text,
      //   },
      // );
    }
    _autovalidateMode = AutovalidateMode.always;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const DefaultAppBar(
        title: 'Registrazione',
      ),
      body: CustomFormWidget(
        formState: _formState,
        autovalidateMode: _autovalidateMode,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimension.defaulPadding),
            child: Text(
              'Ciao ${widget.name}, ci siamo quasi!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimension.defaulPadding),
            child: Text(
              'Crea le tue credenziali!',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Email',
            placeholder: 'Inserisci la tua email',
            value: _emailController.text,
            validationRules: [
              IsEmail(errorMessage: 'L\'email non è valida'),
              IsFilled(errorMessage: 'Il valore è obbligatorio')
            ],
            controller: _emailController,
            onSubmitted: (_) => _passwordFocusNode.requestFocus(),
            focusNode: _emailFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Crea Password',
            placeholder: 'Inserisci la password',
            value: _passwordController.text,
            validationRules: [
              IsPassword(
                  errorMessage:
                      'La password deve contenere almeno una lettera maiuscola e un numero'),
              IsFilled(errorMessage: 'Il valore è obbligatorio')
            ],
            controller: _passwordController,
            onSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
            focusNode: _passwordFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Conferma Password',
            placeholder: 'Inserisci la password',
            value: _confirmPasswordController.text,
            validationRules: [
              IsPassword(
                  errorMessage:
                      'La password deve contenere almeno una lettera maiuscola e un numero'),
              IsEqual(
                errorMessage: 'Le due password devono essere uguali',
                lastValue: _passwordController.text,
              ),
              IsFilled(errorMessage: 'Il valore è obbligatorio')
            ],
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
              title: 'Continua',
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
