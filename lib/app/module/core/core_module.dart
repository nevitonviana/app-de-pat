import 'package:flutter_modular/flutter_modular.dart';

import '../../core/local_storage/flutter_secure_local_storageLocal_storage_impl.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/shared_preferences_local_storage_impl.dart';
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
    i.addLazySingleton<LocalStorage>(SharedPreferencesLocalStorageImpl.new);
    i.addLazySingleton<LocalSecureStorage>(FlutterSecureLocalStorageLocalStorageImpl.new);
  }
}
