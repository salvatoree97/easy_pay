import 'package:features/features.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("prova"),
          onPressed: () => ThemeModeProvider.instance.toggleTheme(),
        ),
      ),
    );
  }
}
