import 'package:features/profile/redux/biometrics_password_thunk.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class BiometricsPasswordScreen extends StatefulWidget {
  const BiometricsPasswordScreen({Key? key}) : super(key: key);

  @override
  State<BiometricsPasswordScreen> createState() =>
      _BiometricsPasswordScreenState();
}

class _BiometricsPasswordScreenState extends State<BiometricsPasswordScreen> {
  late BottomSheetController _sheetController;
  late GlobalKey<FormState> _formState;
  late AutovalidateMode _autovalidateMode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _sheetController = BottomSheetController();
    _formState = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;

    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

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
    return _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;
  }

  void _setObscurePassword(bool isHidden) {
    setState(() => _obscurePassword = isHidden);
  }

  void _setObscureConfirmPassword(bool isHidden) {
    setState(() => _obscureConfirmPassword = isHidden);
  }

  void _setLoading(bool isLoading) {
    setState(() => _isLoading = isLoading);
  }

  void _onConfirmTapped() {
    if (_formState.currentState?.validate() ?? false) {
      StoreProvider.of<AppState>(context).dispatch(
        biometricsPasswordThunk(
          password: _passwordController.text,
          onSuccess: _onSuccess,
          onError: _onError,
        ),
      );
      _setLoading(true);
    } else {
      _autovalidateMode = AutovalidateMode.always;
    }
  }

  void _onCancelTapped() {
    _sheetController.close();
    Navigator.of(context).pop();
  }

  void _onSuccess() {
    _setLoading(false);
    _sheetController.close();
    Navigator.of(context).pop(true);
  }

  void _onError() {
    _setLoading(false);
    _sheetController.close();
    Navigator.of(context).pop(false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetScreen(
      sheetController: _sheetController,
      goBack: false,
      onBottomSheetSlideClosed: () => Navigator.of(context).pop(false),
      maxHeight: 500,
      bottomSheetContent: CustomFormWidget(
        formState: _formState,
        autovalidateMode: _autovalidateMode,
        children: [
          const SizedBox(height: 20),
          TitleDescriptionWidget(
            title: 'Inserisci la password',
            description:
                'Configura la password da salvare utilizzando la biometria',
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            descriptionTextStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
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
            obscureText: _obscureConfirmPassword,
            suffixWidget: PasswordSuffixWidget(
              onTap: _setObscureConfirmPassword,
              isHidden: _obscureConfirmPassword,
            ),
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            onSubmitted: (_) => _onConfirmTapped(),
          ),
          const Expanded(child: SizedBox(height: 40)),
          ButtonsStackWidget(
            buttons: [
              CustomElevatedButton(
                title: 'Conferma',
                onPressed: _onConfirmTapped,
                padding: const EdgeInsets.only(left: Dimension.defaultPadding),
                width: SizeHelper.wp(42),
                enabled: _isButtonEnabled,
                isLoading: _isLoading,
              ),
              CustomElevatedButton(
                title: 'Annulla',
                onPressed: _onCancelTapped,
                padding: const EdgeInsets.only(right: Dimension.defaultPadding),
                width: SizeHelper.wp(42),
                style: CustomButtonTheme.secondaryElavatedButtonTheme.style,
              ),
            ],
          ),
          SizedBox(height: SizeHelper.screenBottomPadding),
        ],
      ),
    );
  }
}
