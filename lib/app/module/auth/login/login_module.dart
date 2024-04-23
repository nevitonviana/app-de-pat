import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LoginPage(),
    );
  }
}
