import 'package:flutter_modular/flutter_modular.dart';

import 'address_page.dart';

class AddressModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const AddressPage(),
    );
  }
}
