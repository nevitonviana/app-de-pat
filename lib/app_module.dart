import 'package:flutter_modular/flutter_modular.dart';

import 'app/module/address/address_module.dart';
import 'app/module/auth/auth_module.dart';
import 'app/module/auth/register/register_module.dart';
import 'app/module/home/home_module.dart';
import 'app/module/schedules/schedules_module.dart';
import 'app/module/supplier/supplier_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module("/", module: AuthModule());
    r.module("/home", module: HomeModule());
    r.module("/address", module: AddressModule());
    r.module("/register", module: RegisterModule());
    r.module("/supplier", module: SupplierModule());
    r.module("/schedules", module: SchedulesModule());
  }
}
