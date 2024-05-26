import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'address_detail_controller.dart';
import 'address_detail_page.dart';

class AddressDetailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AddressDetailController.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => AddressDetailPage(place: r.args.data));
  }
}
