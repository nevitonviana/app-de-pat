import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/logger/logger_app_logger_impl.dart';
import '../../core/rest_client/dio/dio_rest_client.dart';
import '../../core/rest_client/rest_client.dart';
import 'auth/auth_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(AuthStore.new);
    i.addLazySingleton<RestClient>(DioRestClient.new);
    i.addLazySingleton<AppLogger>(LoggerAppLoggerImpl.new);
  }
}
