library core;

///Export [Networking]
export 'package:core/networking/interceptors/base_interceptor.dart';
export 'package:core/networking/interceptors/debug_interceptor.dart';
export 'package:core/networking/interceptors/mock_interceptor.dart';
export 'package:core/networking/interceptors/proxy_interceptor.dart';
export 'package:core/networking/manager/cache_manager.dart';
export 'package:core/networking/manager/network_manager.dart';
export 'package:core/networking/models/cache_options.dart';
export 'package:core/networking/models/cache_type.dart';
export 'package:core/networking/models/content_encoding.dart';
export 'package:core/networking/models/content_type.dart';
export 'package:core/networking/models/host.dart';
export 'package:core/networking/models/http_method.dart';
export 'package:core/networking/models/response_exception.dart';
export 'package:core/networking/service/service.dart';
export 'package:core/networking/configuration/network_manager_configuration.dart';

///Export [Extensions]
export 'package:core/extensions/date_time_extensions.dart';
export 'package:core/extensions/duration_extension.dart';
export 'package:core/extensions/json_extension.dart';
export 'package:core/extensions/string_extensions.dart';
export 'package:core/extensions/time_of_day_extensions.dart';

///Export [Localization]
export 'package:core/localization/generated/l10n.dart';
export 'package:core/localization/utils.dart';

///Export [Logger]
export 'package:core/logger/log_providers/console_log_provider.dart';
export 'package:core/logger/logger.dart';

///Export [Validation]
export 'package:core/validation/regex.dart';
export 'package:core/validation/string_validation.dart';
export 'package:core/validation/validable.dart';
export 'package:core/validation/validation_rule.dart';

///Export [SecureStorage]
export 'package:core/secure/secure_storage_keys.dart';
export 'package:core/secure/secure_storage_manager.dart';

///Export [PersistenceManger]
export 'package:core/secure/persistence_manager.dart';
export 'package:core/secure/persistence_storage_keys.dart';

//Export Packages
export 'package:equatable/equatable.dart';
export 'package:intl/intl.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:dio/dio.dart';
export 'package:provider/provider.dart';
