import 'package:flutter_modular/flutter_modular.dart';

import 'auth/auth_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(AuthStore.new);
  }
}
