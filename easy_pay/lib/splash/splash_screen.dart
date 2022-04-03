import 'package:easy_pay/app/navigation_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(MediaQuery.of(context));
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("prova"),
          onPressed: () =>
              NavigationService.instance.push(AppRoutes.initialScreen),
        ),
      ),
    );
  }
}
