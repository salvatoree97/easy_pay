import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class InitialScreen extends StatefulWidget {
  final bool goToLogin;
  const InitialScreen({
    Key? key,
    this.goToLogin = false,
  }) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.goToLogin) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        _onLoginButtonPressed();
      });
    }
  }

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
      statusBarStyle: SystemUiOverlayStyle.dark,
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
              child: ContainerCachedImage(
                defaultImage: Icons.payment,
                imageUrl:
                    'https://makeanapplike.com/wp-content/uploads/2021/12/How-Can-Digital-Payment-Benefit-Entrepreneurs.jpg',
                height: SizeHelper.hp(48),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Scopri la nostra app',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 10),
            Text(
              'Sottotili',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 30),
            Expanded(child: Container()),
            ButtonsStackWidget(
              buttons: [
                CustomElevatedButton(
                  padding:
                      const EdgeInsets.only(left: Dimension.defaultPadding),
                  width: SizeHelper.wp(42),
                  title: 'Registrati',
                  onPressed: _onRegisterButtonPressed,
                ),
                CustomElevatedButton(
                  padding:
                      const EdgeInsets.only(right: Dimension.defaultPadding),
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
