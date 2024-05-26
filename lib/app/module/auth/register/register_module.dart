import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(RegisterController.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const RegisterPage());
  }
}
