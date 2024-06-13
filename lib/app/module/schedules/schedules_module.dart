import 'package:flutter_modular/flutter_modular.dart';

import 'schedules_page.dart';

class SchedulesModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SchedulesPage());
  }
}
