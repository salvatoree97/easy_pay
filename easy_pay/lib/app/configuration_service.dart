import 'package:common/common.dart';
import 'package:easy_pay/app/configuration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'environment.dart';

class ConfigurationService {
  static Future configure(Store<AppState> store) async {
    if (Configuration.instance.environment == Environment.development) {
      await dotenv.load(fileName: 'env/dev.env').catchError((error) {
        Logger.instance.error(error);
      });
    } else {
      await dotenv.load(fileName: 'env/store.env').catchError((error) {
        Logger.instance.error(error);
      });
    }

    Configuration.instance.appHost = Host(dotenv.env['HOST'] ?? '');

    Configuration.instance.appStore = store;

    if (kDebugMode) {
      NetworkManager.configuration = NetworkManagerConfiguration(
        proxy: dotenv.env['PROXY'],
        enabledProxyman: dotenv.env['ENABLED_PROXYMAN'] == 'true',
        isAllMockEnabled: dotenv.env['ENABLED_MOCK'] == 'true',
      );
    } else {
      NetworkManager.configuration = NetworkManagerConfiguration(
        proxy: null,
        enabledProxyman: false,
        isAllMockEnabled: false,
      );
    }
  }
}
