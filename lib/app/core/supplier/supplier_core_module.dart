import 'package:flutter_modular/flutter_modular.dart';

import '../../module/core/core_module.dart';
import '../../repositories/supplier/supplier_repository.dart';
import '../../repositories/supplier/supplier_repository_impl.dart';
import '../../services/supplier/supplier_service.dart';
import '../../services/supplier/supplier_service_impl.dart';

class SupplierCoreModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<SupplierRepository>(SupplierRepositoryImpl.new);
    i.addLazySingleton<SupplierService>(SupplierServiceImpl.new);
  }
}
