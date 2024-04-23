import 'package:flutter_modular/flutter_modular.dart';

import 'app/module/auth/auth_module.dart';
import 'app/module/core/core_module.dart';
import 'app/module/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(r) {
    r.module("/auth", module: AuthModule());
    r.module("/home", module: HomeModule());
  }
}
