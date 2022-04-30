import 'package:easy_pay/app/navigation_service.dart';
import 'package:easy_pay/app/router_service.dart';
import 'package:easy_pay/splash/splash_screen.dart';
import 'package:features/features.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class EasyPayApp extends StatefulWidget {
  final Store<AppState> store;
  const EasyPayApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<EasyPayApp> createState() => _EasyPayAppState();
}

class _EasyPayAppState extends State<EasyPayApp> {
  @override
  void initState() {
    super.initState();

    ThemeModeProvider.instance.addListener(() {
      setState(() {});
    });
    setCurrentTheme();
  }

  void setCurrentTheme() async {
    final theme = await PersistenceManager.instance
        .readValue<String>(PersistenceKeys.activeTheme);
    if (theme == ThemeMode.dark.rawValue) {
      ThemeModeProvider.instance.toggleTheme();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        title: 'EasyPay App',
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeModeProvider.instance.currentTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [S.delegate],
        home: const SplashScreen(),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (route) => RouterService.generateRoutes(route),
      ),
    );
  }
}
