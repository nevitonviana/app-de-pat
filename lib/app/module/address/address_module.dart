import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import 'address_detail/address_detail_module.dart';
import 'address_page.dart';
import 'address_search_controller.dart';

class AddressModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AddressSearchController.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const AddressPage(),
    );
    r.module("/detail", module: AddressDetailModule());
  }
}
