import 'package:features/features.dart';
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
  late FocusNode _nameFocusNode;
  late FocusNode _surnameFocusNode;
  late FocusNode _fiscalCodeNode;

  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _fiscalCodeController;

  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();

    _nameFocusNode = FocusNode();
    _surnameFocusNode = FocusNode();
    _fiscalCodeNode = FocusNode();

    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _fiscalCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: CustomFormWidget(
        formState: _formState,
        children: const [],
      ),
    );
  }
}
