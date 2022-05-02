import 'package:common/common.dart';
import 'package:common/user/models/user_model.dart';
import 'package:flutter/material.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: DefaultAppBar(title: S.of(context).personal_data_title),
      body: StoreConnector<AppState, UserModel?>(
        converter: (store) => store.state.userState.user,
        builder: (ctx, user) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TitleDescriptionWidget(
                title: S.of(context).name_title,
                description: user?.nameDescription,
              ),
              const SizedBox(height: 20),
              TitleDescriptionWidget(
                title: S.of(context).email_title,
                description: user?.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
