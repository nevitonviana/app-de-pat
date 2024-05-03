import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/dio/dio_rest_client.dart';
import '../../core/rest_client/rest_client.dart';
import 'auth/auth_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(AuthStore.new);
    i.addLazySingleton<RestClient>(DioRestClient.new);
  }
}
