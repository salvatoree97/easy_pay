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
              'Inserisci i tuoi dati personali',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Nome',
            placeholder: 'Inserisci il nome',
            value: _nameController.text,
            validationRules: [
              IsFilled(errorMessage: 'Il valore è obbligatorio'),
            ],
            controller: _nameController,
            onSubmitted: (_) => _lastnameFocusNode.requestFocus(),
            focusNode: _nameFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Cognome',
            placeholder: 'Inserisci il cognome',
            value: _lastnameController.text,
            validationRules: [
              IsFilled(errorMessage: 'Il valore è obbligatorio'),
            ],
            controller: _lastnameController,
            onSubmitted: (_) => _fiscalCodeNode.requestFocus(),
            focusNode: _lastnameFocusNode,
          ),
          const SizedBox(height: 20),
          CustomFormTextField(
            title: 'Codice Fiscale',
            placeholder: 'Inserisci il tuo codice fiscale',
            value: _fiscalCodeController.text,
            validationRules: [
              IsFilled(errorMessage: 'Il valore è obbligatorio'),
            ],
            controller: _fiscalCodeController,
            focusNode: _fiscalCodeNode,
            onSubmitted: (_) => _onButtonPressed(),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container()),
          const SizedBox(height: 20),
          CustomElevatedButton(
            title: 'Continua',
            enabled: _isButtonEnabled,
            onPressed: _onButtonPressed,
          ),
        ],
      ),
    );
  }
}
