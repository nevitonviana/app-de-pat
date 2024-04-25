import 'package:flutter_modular/flutter_modular.dart';

import 'home/auth_home_page.dart';
import 'login/login_module.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => AuthHomePage(authStore: Modular.get()));
    r.module('/login', module: LoginModule());
  }
}
