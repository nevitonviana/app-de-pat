import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  List<Module> get imports => [
        CoreModule(),
        // SupplierCoreModule(),
      ];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
