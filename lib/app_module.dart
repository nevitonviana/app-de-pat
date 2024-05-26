import 'package:flutter_modular/flutter_modular.dart';

import 'app/module/address/address_module.dart';
import 'app/module/auth/auth_module.dart';
import 'app/module/auth/register/register_module.dart';
import 'app/module/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module("/auth", module: AuthModule());
    r.module("/home", module: HomeModule());
    r.module("/address", module: AddressModule());
    r.module("/register", module: RegisterModule());
  }
}
