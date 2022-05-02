import 'package:flutter/material.dart';
import 'package:common/common.dart';

class RegistrationFirstStepScreen extends StatefulWidget {
  const RegistrationFirstStepScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationFirstStepScreen> createState() =>
      _RegistrationFirstStepScreenState();
}

class _RegistrationFirstStepScreenState
    extends State<RegistrationFirstStepScreen> {
  late GlobalKey<FormState> _formState;
  late AutovalidateMode _autovalidateMode;
  late FocusNode _nameFocusNode;
  late FocusNode _lastnameFocusNode;
  late FocusNode _fiscalCodeNode;

  late TextEditingController _nameController;
  late TextEditingController _lastnameController;
  late TextEditingController _fiscalCodeController;

  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;

    _nameFocusNode = FocusNode();
    _lastnameFocusNode = FocusNode();
    _fiscalCodeNode = FocusNode();

    _nameController = TextEditingController()
      ..addListener(_textControllerListner);
    _lastnameController = TextEditingController()
      ..addListener(_textControllerListner);
    _fiscalCodeController = TextEditingController()
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
    return (_nameController.text.isNotEmpty &&
        _lastnameController.text.isNotEmpty &&
        _fiscalCodeController.text.isNotEmpty);
  }

  void _onButtonPressed() {
    if (_formState.currentState?.validate() == true) {
      PackageConfiguration.navigationService.push(
        AppRoutes.registrationSecondStepScreen,
        arguments: {
          'name': _nameController.text,
          'lastname': _lastnameController.text,
          'fiscalCode': _fiscalCodeController.text,
        },
      );
    }
    _autovalidateMode = AutovalidateMode.always;
    setState(() {});
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
              S.of(context).personal_data_description,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).name_title,
            placeholder: S.of(context).name_placeholder,
            value: _nameController.text,
            validationRules: [
              IsFilled(errorMessage: S.of(context).required_error_message),
            ],
            controller: _nameController,
            onSubmitted: (_) => _lastnameFocusNode.requestFocus(),
            focusNode: _nameFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).lastname_title,
            placeholder: S.of(context).lastname_placeholder,
            value: _lastnameController.text,
            validationRules: [
              IsFilled(errorMessage: S.of(context).required_error_message),
            ],
            controller: _lastnameController,
            onSubmitted: (_) => _fiscalCodeNode.requestFocus(),
            focusNode: _lastnameFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: S.of(context).fiscalcode_title,
            placeholder: S.of(context).fiscalcode_placeholder,
            value: _fiscalCodeController.text,
            validationRules: const [],
            controller: _fiscalCodeController,
            focusNode: _fiscalCodeNode,
            onSubmitted: (_) => _onButtonPressed(),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container()),
          const SizedBox(height: 20),
          CustomElevatedButton(
            title: S.of(context).continue_button_text,
            enabled: _isButtonEnabled,
            onPressed: _onButtonPressed,
          ),
        ],
      ),
    );
  }
}
