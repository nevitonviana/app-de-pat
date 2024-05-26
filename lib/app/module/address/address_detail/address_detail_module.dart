import 'package:flutter_modular/flutter_modular.dart';

import 'address_detail_page.dart';

class AddressDetailModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => AddressDetailPage(place: r.args.data));
  }
}
