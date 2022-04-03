import 'package:easy_pay/app.dart';
import 'package:easy_pay/app/configuration.dart';
import 'package:easy_pay/app/configuration_service.dart';
import 'package:easy_pay/app/environment.dart';
import 'package:easy_pay/app/route_resolver_service.dart';
import 'package:easy_pay/app/store_configuration.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Configuration.instance.environment = Environment.development;
  Logger.instance.register(provider: ConsoleLogProvider());
  Logger.instance.info("Running development configuration");

  final store = storeInitialise();
  await ConfigurationService.configure(store);
  await FirebaseService.instance.initialize();
  await PushNotificationService.instance
      .initialize(resolver: RouteResolverService.instance);
  runApp(EasyPayApp(store: store));
}
