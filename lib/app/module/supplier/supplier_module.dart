import 'package:flutter_modular/flutter_modular.dart';

import 'supplier_page.dart';

class SupplierModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SupplierPage(),
    );
  }
}
