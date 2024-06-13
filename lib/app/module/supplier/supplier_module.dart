import 'package:flutter_modular/flutter_modular.dart';

import '../../core/supplier/supplier_core_module.dart';
import 'supplier_controller.dart';
import 'supplier_page.dart';

class SupplierModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(SupplierController.new);
  }

  @override
  List<Module> get imports => [
        // CoreModule(),
        SupplierCoreModule(),
      ];

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SupplierPage(
        supplierId: r.args.data,
      ),
    );
  }
}
