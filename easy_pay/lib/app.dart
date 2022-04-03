import 'package:easy_pay/app/navigation_service.dart';
import 'package:easy_pay/app/router_service.dart';
import 'package:easy_pay/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class EasyPayApp extends StatelessWidget {
  final Store store;
  const EasyPayApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'EasyPay App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [S.delegate],
        home: const SplashScreen(),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (route) => RouterService.generateRoutes(route),
      ),
    );
  }
}
