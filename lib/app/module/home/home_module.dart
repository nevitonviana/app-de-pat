import 'package:flutter_modular/flutter_modular.dart';

import '../../core/supplier/supplier_core_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  List<Module> get imports => [
        // CoreModule(), ja foi importado pelo supplier, talzer pode ser um bog
        SupplierCoreModule(),
      ];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
