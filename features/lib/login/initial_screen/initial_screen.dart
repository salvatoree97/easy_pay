import 'package:common/common.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  void _onRegisterButtonPressed() {
    PackageConfiguration.navigationService
        .push(AppRoutes.registrationFirstStepScreen);
  }

  void _onLoginButtonPressed() {
    PackageConfiguration.navigationService.push(AppRoutes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      incudeTopSafeArea: false,
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              child: Container(
                color: CustomColors.red,
                height: SizeHelper.hp(48),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Scopri la nostra app',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Sottotili',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 30),
            Expanded(child: Container()),
            ButtonsStackWidget(
              buttons: [
                CustomElevatedButton(
                  padding: const EdgeInsets.only(left: Dimension.defaulPadding),
                  width: SizeHelper.wp(42),
                  title: 'Registrati',
                  onPressed: _onRegisterButtonPressed,
                ),
                CustomElevatedButton(
                  padding:
                      const EdgeInsets.only(right: Dimension.defaulPadding),
                  width: SizeHelper.wp(42),
                  title: 'Login',
                  onPressed: _onLoginButtonPressed,
                  style: CustomButtonTheme.secondaryElavatedButtonTheme.style,
                ),
              ],
            ),
            SizedBox(height: SizeHelper.hp(10)),
          ],
        ),
      ),
    );
  }
}
